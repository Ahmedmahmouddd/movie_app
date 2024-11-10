import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/keyword_mapper.dart';
import 'package:movie_app/common/helper/mapper/trailer_mapper.dart';
import 'package:movie_app/common/helper/mapper/tv_mapper.dart';
import 'package:movie_app/core/models/keyword.dart';
import 'package:movie_app/core/models/trailer.dart';
import 'package:movie_app/data/tv/models/tv.dart';
import 'package:movie_app/data/tv/sources/tv_service.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getPopularTV() async {
    var data = await sl<TVService>().getPopulerTV();
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        var tv = List.from(data['content']).map((item) => TvMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(tv);
      },
    );
  }

  @override
  Future<Either> getTvTrailer(int tvId) async {
    var data = await sl<TVService>().getTvTrailer(tvId);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        if (data['trailers'].isEmpty) {
          return const Left('No trailer found');
        } else {
          var trailer = TrailerMapper.toEntity(TrailerModel.fromJson(data['trailers'][0]));
          return Right(trailer);
        }
      },
    );
  }

  @override
  Future<Either> getRecommendedTv(int tvId) async {
    var data = await sl<TVService>().getRecommendedTv(tvId);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tv = List.from(data['content']).map((item) => TvMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(tv);
      },
    );
  }

  @override
  Future<Either> getSimilarTv(int tvId) async {
    var data = await sl<TVService>().getSimilarTv(tvId);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data['content']).map((item) => TvMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getTvKeywords(int tvId) async {
    var data = await sl<TVService>().getTvKeywords(tvId);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> searchTv(String query) async {
    var data = await sl<TVService>().searchTv(query);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data['content']).map((item) => TvMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }
}
