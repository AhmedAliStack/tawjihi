part of 'achievements_cubit.dart';

abstract class AchievementsState {}

class AchievementsInitial extends AchievementsState {}

class LoadingAchievementsState extends AchievementsState {}

class SuccessAchievementsState extends AchievementsState {}

class ErrorAchievementsState extends AchievementsState {
  final String? error;
  ErrorAchievementsState({this.error});
}
