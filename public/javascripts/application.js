$(function() {
	$('.skill').hide();
	
	$('a.add').click(function(e) {
		
		var element = $('.skill:hidden:first')
		
		//si hay elementos para mostrar, hacerlo
		if (element[0]) 
		{
			$(element).show();
		}
		
		//si todos los elementos fueron mostrados, eliminar link a agregar
		// TO-DO: refactor
		if ($('.skill:hidden').size() == 0)
		{
			$('a.add').hide();
		}
		
		e.preventDefault();
	});
	
	$('a.remove').click(function(e) {
		$(this).parent().hide();
		$('a.add').show();
		
		e.preventDefault();
	});
});