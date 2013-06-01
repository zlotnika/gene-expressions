var TissuesApp = angular.module('TissuesApp', ['ngResource'])

TissuesApp.controller('TissuesCtrl', ['$scope', 'Tissue', 'Gene', 'Probeset', 'Expression', function($scope, Tissue, Gene, Probeset, Expression){
    $scope.tissues = Tissue.query();
    $scope.genes = Gene.query();
    $scope.probesets = Probeset.query();
    $scope.expressions = Expression.query();
    $scope.change_tissues = function(){
	$scope.tissues.push({name: 'new_tissue', total: 1})
    }
 }])


TissuesApp.factory('Gene', ['$resource', function($resource){
    return $resource('/genes');
}])

TissuesApp.factory('Probeset', ['$resource', function($resource){
    return $resource('/probesets');
}])

TissuesApp.factory('Tissue', ['$resource', function($resource){
    return $resource('/tissues');
}])

TissuesApp.factory('Expression', ['$resource', function($resource){
    return $resource('/expressions');
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


TissuesApp.directive('chart', function(){
    return{
        restrict: 'E', // chart can only be an element
        link: function(scope, elem, attrs){
	    console.log("scope", scope)
	    console.log("elem", elem)
	    console.log("attrs", attrs)
	    var dataize = function(data){
		console.log("data", data)
		return $.map(data,function(gene){ //(tissue){
		    console.log(gene.id, gene.symbol)
		    return[[gene.id, gene.symbol, "lori's variable of fun"]]// [[tissue.total, tissue.name]]
		});
	    }
            var chart = null,
                opts  = { };
                   
            scope.$watch(attrs.ngModel, function(v){ //where does v come from??? 
		console.log('v', v)
		v = dataize(v)
		console.log('new v', v)
		v = [v]
//		v = [ [[0, 1], [1, 5], [2, 2]] ]
		console.log(v)

	var opts = {
	    series: {
		bars: {
		    fill: true,
		    show: true,
		    barWidth: 0.6,
		    horizontal: true,
		    align: "center" }
	    },
	    xaxis: {
//		mode: "categories",
		tickLength: 0
            },
	    yaxis: {
		mode: "categories",
		position: top
	    }
	}

                if(!chart){
                    chart = $.plot(elem, v , opts);
		    console.log("elem", elem)
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

TissuesApp.directive('copychart', function(){
    return{
        restrict: 'E', // chart can only be an element
        link: function(scope, elem, attrs){
	    console.log("scope", scope)
	    console.log("elem", elem)
	    console.log("attrs", attrs)
	    var dataize = function(data){
		console.log("data", data)
		return $.map(data,function(gene){ //(tissue){
		    console.log(gene.id, gene.symbol)
		    return[[gene.id, gene.symbol, "lori's variable of fun"]]// [[tissue.total, tissue.name]]
		});
	    }
            var copychart = null,
                opts  = { };
                   
            scope.$watch(attrs.ngModel, function(v){ //where does v come from??? 
		console.log('v', v)
		v = dataize(v)
		console.log('new v', v)
		v = [v]
//		v = [ [[0, 1], [1, 5], [2, 2]] ]
		console.log(v)

	var opts = {
	    series: {
		bars: {
		    fill: true,
		    show: true,
		    barWidth: 0.6,
		    horizontal: true,
		    align: "center" }
	    },
	    xaxis: {
//		mode: "categories",
		tickLength: 0
            },
	    yaxis: {
		mode: "categories",
		position: top
	    }
	}

                if(!copychart){
                    copychart = $.plot(elem, v , opts);
		    console.log("elem", elem)
                    $(elem).show();
                }else{
                    copychart.setData(v);
                    copychart.setupGrid();
                    copychart.draw();
                }
            }, true)
	    
        }
    };
});


TissuesApp.filter('sort_by_totals', function(){
    return function(number){
	if(number >= 5){
	    return number }
	else{
	    return false
	}
    }
})


