import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lab_8/models/get_post.dart';
import 'package:lab_8/post/repository/post_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final _repository = PostRepository();
  PostBloc() : super(PostInitial()) {
    on<GetPostEvent>((event, emit) async {
      log("Получено событие GetPostEvent");

      emit(LoadingPostState());
      try {
        final posts = await _repository.getPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(FailurePostState(e.toString()));
      }
    });
  }
}