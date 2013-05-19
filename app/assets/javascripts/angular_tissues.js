var TissuesApp = angular.module('TissuesApp', ['ngResource'])

TissuesApp.controller('TissuesCtrl', ['$scope', 'Tissue', function($scope, Tissue){
    $scope.thing1 = "bindings are fun"
    $scope.tissues = Tissue.query();
    $scope.change_tissues = function(){
	$scope.tissues.push({name: 'new_tissue', total: 1})
    }

    $scope.get_tissue_names = function(){
	data = []
	for (i = 0; i < $scope.tissues.length; i++){
	    data.push($scope.tissues[i].name)}
	return data
    }
    $scope.return_thing = function(){
	total = []
	for(i=0; i < 100; i++){
	    total.push($scope.tissues[i])
	}
	return total
    }
    $scope.thing = $scope.return_thing()
    $scope.datas = $scope.get_tissue_names()
    $scope.get_tissue_totals = function(){
//	console.log("getting tissue totals")
	totals = []
	for (i = 0; i < $scope.tissues.length; i++){
	    console.log($scope.tissues[i].total);
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
<<<<<<< HEAD
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
=======

    $(function(){
	var data = [$scope.get_tissue_totals()]
	var data = [[[4, "erstwhile"],[3,"kitten"],[5,$scope.thing1]]];
//	console.log(data)
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
>>>>>>> b60f707bc5022fbe1fdff8c1154ead822284fa26

}])

TissuesApp.factory('Tissue', ['$resource', function($resource){
<<<<<<< HEAD
//    console.log($resource('/tissues'))
=======
>>>>>>> b60f707bc5022fbe1fdff8c1154ead822284fa26
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

<<<<<<< HEAD

  
=======
TissuesApp.directive('chart', function(){
    return{
        restrict: 'E',
        link: function(scope, elem, attrs){

	    var dataize = function(data){
		return $.map(data,function(tissue){
		    return [[tissue.name, tissue.total]]
		});
	    }

            var chart = null,
                opts  = { };
                   
            scope.$watch(attrs.ngModel, function(v){
		v = dataize(v)
		v = [v]
//		v = [ [[0, 1], [1, 5], [2, 2]] ]
		console.log(v)

	var opts = {
	    series: {
		bars: {
		    fill: true,
		    show: true,
		    barWidth: 0.6,
//		    horizontal: true,
		    align: "center" }
	    },
	    xaxis: {
		mode: "categories",
		tickLength: 0
            },
	    yaxis: {
		position: top
	    }
	}


                if(!chart){
                    chart = $.plot(elem, v , opts);
                    $(elem).show();
                }else{
                    chart.setData(v);
                    chart.setupGrid();
                    chart.draw();
                }
            }, true)
	    
        }
    };
});
>>>>>>> b60f707bc5022fbe1fdff8c1154ead822284fa26
