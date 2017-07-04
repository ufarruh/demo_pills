App.factory("PharmacyService", ["Restangular", function(Restangular){

  var PharmacyService = {};

  PharmacyService.create = function(pharmacy){
    return Restangular.all("pharmacies").post({
      pharmacy: {
        name: pharmacy.name,
        work_hours: pharmacy.work_hours,
        phone_number: pharmacy.phone_number,
        region: pharmacy.region,
        address: pharmacy.address
      }
    }).then(function(response){
      return response;
    });
  };


  return PharmacyService;


}]);