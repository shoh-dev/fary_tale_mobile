import 'dart:developer';

import 'package:fairy_tale_app/components/translator_component.dart';
import 'package:fairy_tale_app/features/tale_list/selected_tale/components/selected_tale_page_background.dart';
import 'package:fairy_tale_app/features/tale_list/selected_tale/components/selected_tale_page_navigator.dart';
import 'package:fairy_tale_app/manager/redux.dart';
import 'package:fairy_tale_app/manager/repositories/tale/models.dart';
import 'package:fairy_tale_app/manager/services.dart';
import 'package:flutter/material.dart';
import 'package:myspace_data/myspace_data.dart';
import 'package:myspace_design_system/myspace_design_system.dart';
import 'components/selected_tale_interaction_object.dart';

class SelectedTalePage extends StatefulWidget {
  const SelectedTalePage({
    super.key,
    required this.taleId,
  });

  final String taleId;

  @override
  State<SelectedTalePage> createState() => _SelectedTalePageState();
}

class _SelectedTalePageState extends State<SelectedTalePage> with StateHelpers, WidgetsBindingObserver {
  final pageController = PageController();

  AudioPlayerService audioService(BuildContext context) {
    throw Exception('Not implemented');
    // return context.getDepdendency<DependencyInjection>().interactionAudioPlayerService;//todo:
  }

  @override
  void dispose() {
    safeDispose(() {
      if (audioService(context).isPlaying()) {
        stopAudio(audioService(context));
      }
      pageController.dispose();
      WidgetsBinding.instance.removeObserver(this);
    });
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    safeInitialize(() {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log(state.toString());

    final bool isAudioPlaying = audioService(context).isPlaying();

    if (isAudioPlaying) {
      if (state case AppLifecycleState.hidden || AppLifecycleState.inactive || AppLifecycleState.paused) {
        pauseAudio(audioService(context));
      }
      if (state case AppLifecycleState.detached) {
        stopAudio(audioService(context));
      }
    } else {
      if (state case AppLifecycleState.resumed) {
        resumeAudio(audioService(context));
      }
    }
  }

  void pauseAudio(AudioPlayerService audioService) async {
    final paused = await audioService.pause();
    paused.when(
      ok: (ok) {
        log("audio paused");
      },
      error: (error) {
        log(error.toString());
      },
    );
  }

  void stopAudio(AudioPlayerService audioService) async {
    final stopped = await audioService.stop();
    stopped.when(
      ok: (ok) {
        log("audio stopped");
      },
      error: (error) {
        log(error.toString());
      },
    );
  }

  void resumeAudio(AudioPlayerService audioService) async {
    final resumed = await audioService.play();
    resumed.when(
      ok: (ok) {
        log("audio resumed");
      },
      error: (error) {
        log(error.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StateConnector<AppState, TaleState>(
        selector: (state) => state.taleListState.taleState,
        onInitialBuild: (dispatch, viewModel) async {
          dispatch(GetTaleAction(widget.taleId));
        },
        onDispose: (dispatch) {
          dispatch(GetTaleAction(widget.taleId, reset: true));
        },
        builder: (context, dispatch, vm) {
          return Scaffold(
            body: vm.selectedTaleResult.when(
              ok: () {
                return _TaleView(
                  tale: vm.selectedTale,
                  pageController: pageController,
                  onInteraction: (value) => dispatch(TaleInteractionHandlerAction(value)),
                );
              },
              error: (error) {
                return Center(
                  child: TextComponent.any(error.toString()),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              initial: () {
                return const SizedBox();
              },
            ),
          );
        });
  }
}

class _TaleView extends StatefulWidget {
  const _TaleView({
    required this.tale,
    required this.pageController,
    required this.onInteraction,
  });

  final PageController pageController;
  final Tale tale;
  final ValueChanged<TaleInteraction> onInteraction;

  @override
  State<_TaleView> createState() => _TaleViewState();
}

class _TaleViewState extends State<_TaleView> with StateHelpers {
  @override
  void initState() {
    super.initState();
    safeInitialize(() async {
      if (!widget.tale.isPortrait) {
        // context.getDependency<SystemServiceImpl>().setDeviceOrientation([
        // DeviceOrientation.landscapeLeft,
        // DeviceOrientation.landscapeRight,
        // ]).then(
        // (value) {
        // if (value.isError) {
        // log((value as ErrorX).toString());
        // }
        // },
        // );//todo: add as action
      }
    });
  }

  @override
  void dispose() {
    // safeDispose(() async {
    // context.getDependency<SystemServiceImpl>().setDeviceOrientation([
    // DeviceOrientation.portraitDown,
    // DeviceOrientation.portraitUp,
    // ]).then(
    // (value) {
    // if (value.isError) {
    // log((value as ErrorX).toString());
    // }
    // },
    // );
    // });//todo:
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final audioService = context.getDepdendency<DependencyInjection>().interactionAudioPlayerService;
    return Translator(
        toTranslate: [
          widget.tale.title,
          widget.tale.description,
        ],
        builder: (translatedValue) {
          return Scaffold(
            appBar: AppBar(
              title: TextComponent.any(translatedValue[0]),
              actions: [
                StreamBuilder(
                    stream: audioService.isPlayingStream,
                    builder: (context, snapshot) {
                      if (snapshot.data == true) {
                        return const Tooltip(
                          triggerMode: TooltipTriggerMode.tap,
                          message: 'Audio is playing',
                          child: Icon(Icons.pause),
                        );
                      }
                      return const SizedBox();
                    }),
                const SizedBox(width: 10),
              ],
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Text(
                  translatedValue[1],
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            body: LayoutBuilder(builder: (context, cc) {
              return PageView.builder(
                controller: widget.pageController,
                itemCount: widget.tale.talePages.length,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final page = widget.tale.talePages[index];
                  return Stack(
                    children: [
                      //image
                      if (page.backgroundImage.isNotEmpty) Positioned.fill(child: SelectedTalePageBackroundComponent(imageUrl: page.backgroundImage)),

                      for (var interaction in page.taleInteractions)
                        //tale object
                        AnimatedPositioned(
                          // curve: Curves.ease, //todo: get curve from db
                          duration: Duration(milliseconds: interaction.animationDuration),
                          width: interaction.size.width,
                          height: interaction.size.height,
                          left: interaction.currentPosition.dx,
                          top: interaction.currentPosition.dy,
                          child: SelectedTaleInteractionObjectComponent(
                            interaction: interaction,
                            onInteraction: widget.onInteraction,
                          ),
                        ),
                    ],
                  );
                },
              );
            }),
            bottomNavigationBar: BottomAppBar(
              child: SelectedTalePageNavigatorComponent(
                controller: widget.pageController,
                totalPages: widget.tale.talePages.length,
                interactions: widget.pageController.hasClients
                    ? widget.tale.talePages[widget.pageController.page?.toInt() ?? 0].taleInteractions
                    : widget.tale.talePages.first.taleInteractions,
              ),
            ),
          );
        });
  }
}
