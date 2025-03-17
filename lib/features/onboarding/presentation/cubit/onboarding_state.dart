part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  const OnboardingState({required this.page});
  final int page;
  @override
  List<Object?> get props => [page];
}
