abstract class AppState{}
class AppInitialState extends AppState{}


class FetchDataLoadingState extends AppState{}
class FetchDataSuccessState extends AppState{}
class FetchDataFailedState extends AppState{}

class SearchLoadingState extends AppState{}
class SearchLoadedState extends AppState{}
class SearchFailedState extends AppState{}

class ChangeCurrentIndexState extends AppState{}

class ChangeThemeModeState extends AppState{}