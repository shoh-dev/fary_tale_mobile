import 'package:fairy_tale_app/manager/repositories/tale/models.dart';
import 'package:myspace_data/myspace_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class TaleRepository {
  ResultFuture<List<Tale>> getAllTales();
  ResultFuture<Tale> getTaleById(String taleId);
}

class TaleRepositoryImpl implements TaleRepository {
  final SupabaseClient _supabase;

  const TaleRepositoryImpl(this._supabase);

  @override
  ResultFuture<List<Tale>> getAllTales() async {
    try {
      final response = await _supabase
          .from('tales')
          .select('id, title, description, cover_image');

      return Result.ok(response.map(Tale.fromJson).toList());
    } catch (e) {
      return Result.error(ErrorX(e));
    }
  }

  @override
  ResultFuture<Tale> getTaleById(String taleId) async {
    try {
      final response = await _supabase
          .from('tales')
          .select('*, tale_pages(*, tale_interactions(*))')
          .eq('id', taleId)
          .maybeSingle();

      if (response == null) return const Result.error(ErrorX('Tale not found'));

      return Result.ok(Tale.fromJson(response));
    } catch (e) {
      return Result.error(ErrorX(e));
    }
  }
}
