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
	
	$('.skill select#category_category_id').change(function(e) {
		var category_id = $(this).find('option:selected').val();
		var selected = $(this).siblings('select:first').focus();
		
		$.get('../workers/skills_by_category.xml?id=' + category_id, function(doc){
			$(doc).find('skill').each(function() {
					var name = $(this).find('name').text();
					var id = $(this).find('category-id').text();
					//$(selected).append().html(function(){
					//	return '<option value=' + id +'>' + name + '</option>'
					//});
					$(selected).append('<option value=' + id +'>' + name + '</option>')
					return false;
			});
		})
	});
});