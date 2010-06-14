$(function() {
	
	// hacer un clear del campo de search cuando tiene foco
	$("input[name='search-textbox']").focus(function() {
		if( this.value == this.defaultValue ) {
			this.value = "";
		}
	}).blur(function() {
		if( !this.value.length ) {
			this.value = this.defaultValue;
		}
	});
	
	// bind "click" event for links with type="submit" 
	$("a.mainButton").click( function(){
	  // it submits the form it is contained within
	  $(this).parents("form").submit();
	});
	
	$('.skill').hide();
	
	$('a.add').click(function(e) {
		
		var element = $('.skill:hidden:first')
		
		//si hay elementos para mostrar, hacerlo
		if (element[0]) 
		{
			$(element).show();
			$(element).find('#subcategory_subcategory_id').attr('disabled', true);
			$(element).find('select:last').attr('disabled', true);
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
		selected.removeAttr('disabled');
		
		$.get('../xhr/subcategories?id=' + category_id, function(doc){
			$(doc).find('category').each(function() {
					var name = $(this).find('name').text();
					var id = $(this).find('id').text();
					$(selected).append('<option value=' + id +'>' + name + '</option>');
			});
			return false;
		})
	});
	
	$('.skill select#subcategory_subcategory_id').change(function(e) {
		var category_id = $(this).find('option:selected').val();
		var selected = $(this).siblings('select:last').focus();
		selected.removeAttr('disabled');
		
		$.get('../xhr/skills?id=' + category_id, function(doc){
			$(doc).find('skill').each(function() {
					var name = $(this).find('name').text();
					var id = $(this).find('id').text();
					$(selected).append('<option value=' + id +'>' + name + '</option>');
			});
		})
	});
});