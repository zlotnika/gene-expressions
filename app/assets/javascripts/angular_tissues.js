var TissuesApp = angular.module('TissuesApp', ['ngResource'])

TissuesApp.controller('TissuesCtrl', ['$resource', '$scope', 'Tissue', function($resource, $scope, Tissue){
    var Gene = $resource('/genes')
    console.log(Gene)
    $scope.genes = Gene.query()
    $scope.genes_first = function(){
	return $scope.genes[0] }
    $scope.first_gene = $scope.genes_first()
//    $scope.genes = Gene.get()
  //  console.log($scope.genes)
    $scope.tissues = Tissue.query();
    $scope.get_tissue_names = function(){
	data = []
	for (i = 0; i < 101; i++){ //$scope.tissues.length
	    data.push($scope.tissues[i])} //.name
	return data
    }
    $scope.tissue_names = $scope.get_tissue_names()
    $scope.datas = $scope.get_tissue_names()
    $scope.thing1 = "bindings are fun"
    $scope.get_tissue_totals = function(){
	console.log("getting tissue totals")
	totals = []
	for (i = 0; i < $scope.tissues.length; i++){
	    totals.push([$scope.tissues[i].total, $scope.tissues[i].name])
	    if ($scope.datas.length > $scope.tissues.length){ // without this, it repeats way too many times
		$scope.datas.push([$scope.tissues[i].total, $scope.tissues[i].name])}}
	return totals
    }
    $scope.things = ["hi","hello"];
    $scope.todos = [
	{text:'learn stuff', done:true},
	{text:'build a thing', done:false},
	{text:'stuff', done: false}];
    $scope.done_todos = function(){
	done_ones = [];
	angular.forEach($scope.todos, function(todo){
	    if (todo.done){
		done_ones.push(todo);
	    }
	})
	return done_ones;
    }
    $scope.finisheds = $scope.done_todos();
  $(function(){
    var data = [$scope.get_tissue_totals()]
    var data = [[[4, "erstwhile"],[3,"kitten"],[5,$scope.thing1]]];
//    console.log(data)
    var options = {
      series: {
        bars: {
          fill: true,
          show: true,
          barWidth: 0.6,
          horizontal: true,
          align: "center" }
      },
      yaxis: {
         mode: "categories",
         tickLength: 0
         },
      xaxis: {
        position: top
	}
    }
    $.plot($("#tissues_chart"), data, options)
})

}])

TissuesApp.factory('Tissue', ['$resource', function($resource){
//    console.log($resource('/tissues'))
    return $resource('/tissues');
}])

TissuesApp.filter('sort_by_totals', function(){
    return function(number){
	if(number >= 5){
	    return number }
	else{
	    return false
	}
    }
})


  
