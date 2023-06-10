part of 'achievements_details_cubit.dart';

abstract class AchievementsDetailsState {}

class AchievementsDetailsInitial extends AchievementsDetailsState {}

class LoadingAchievementsDetailsState extends AchievementsDetailsState {}

class SuccessAchievementsDetailsState extends AchievementsDetailsState {}

class ErrorAchievementsDetailsState extends AchievementsDetailsState {
  final String? error;
  ErrorAchievementsDetailsState({this.error});
}
