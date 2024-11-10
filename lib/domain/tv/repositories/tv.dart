import 'package:dartz/dartz.dart';

abstract class TVRepository {
  Future<Either> getPopularTV();
  Future<Either> getTvTrailer(int tvId);
  Future<Either> getRecommendedTv(int tvId);
  Future<Either> getSimilarTv(int tvId);
  Future<Either> getTvKeywords(int tvId);
  Future<Either> searchTv(String query);
}
