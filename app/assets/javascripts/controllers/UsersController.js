App.controller("UsersController", ["$scope", "$rootScope", "Auth", "$state", "FavoriteService", "Restangular",
                                   function($scope, $rootScope, Auth, $state, FavoriteService, Restangular){
  
  $scope.$on('devise:new-registration', function (e, user){
    $scope.user = user;
  });

  $scope.$on('devise:login', function (e, user){
    $scope.user = user;
  });

  $scope.$on('devise:logout', function (e, user){
    $scope.user = {};
  });

  $scope.$on('devise:login-error', function(e, reason){
    $scope.error = reason.eroors[0];
    console.log(reason);
  });

  
  $rootScope.signedIn = Auth.isAuthenticated;
  $scope.logout = Auth.logout;
  
  Auth.currentUser().then(function (user){
    $scope.user = user;
  });

  if($rootScope.signedIn()){
    $scope.favorites = Restangular.all("users").customGETLIST("favorites").$object;
  }


   $scope.unfavorite = function(drug){
    FavoriteService.unfavorite(drug)
      .then(function(response){

        $scope.favorites = Restangular.all("users").customGETLIST("favorites").$object;
      
      });
   };



  $scope.login = function(isValid){
    $scope.submitted = true;

      if(isValid){
        Auth.login($scope.user).then(function(){
          $state.go('home.profile');
        }); 
      };
  };

  $scope.register = function(isValid) {
      $scope.submitted = true;

      if(isValid){
        Auth.register($scope.user).then(function(){
          $state.go('home.profile'); 
        }); 
      
      };
  };



}]);