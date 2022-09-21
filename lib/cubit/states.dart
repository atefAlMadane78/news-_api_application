abstract class NewsStates{}

class NewsIniatialStates extends NewsStates{}

class NewsBottomNavStates extends NewsStates{}

class NewsGetBusineesLoadingStates extends NewsStates{}

class NewsBusineesSuccessStates extends NewsStates{}

class NewsBusineesErrorStates extends NewsStates{
  final String error ;

  NewsBusineesErrorStates(this.error);

}

class NewsGetSportsLoadingStates extends NewsStates{}

class NewsSportsSuccessStates extends NewsStates{}

class NewsSportsErrorStates extends NewsStates{
  final String error ;

  NewsSportsErrorStates(this.error);

}
class NewsGetSciencesLoadingStates extends NewsStates{}

class NewsSciencesSuccessStates extends NewsStates{}

class NewsSciencesErrorStates extends NewsStates{
  final String error ;

  NewsSciencesErrorStates(this.error);

}

class NewsThemeStates extends NewsStates{}

class NewsGetSearchLoadingStates extends NewsStates{}

class NewsSearchSuccessStates extends NewsStates{}

class NewsSearchErrorStates extends NewsStates{
  final String error ;

  NewsSearchErrorStates(this.error);
  
}