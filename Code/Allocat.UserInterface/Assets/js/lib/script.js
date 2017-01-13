
var init = [];

init.push(function () {
$('#main-navbar-notifications').slimScroll({ height: 250 });
});

//<-- DATEPICKER -->
init.push(function () {
						var options = {
							todayBtn: "linked",
							orientation: $('body').hasClass('right-to-left') ? "auto right" : 'auto auto'
						}
						$('#bs-datepicker-example').datepicker(options);

						$('#bs-datepicker-component').datepicker();

						var options2 = {
							orientation: $('body').hasClass('right-to-left') ? "auto right" : 'auto auto'
						}
						$('#bs-datepicker-range').datepicker(options2);

						$('#bs-datepicker-inline').datepicker();
					});			
//<-- /. DATEPICKER -->

//<-- HTML_EDITOR -->
			init.push(function () {
				if (! $('html').hasClass('ie8')) {
					$('#summernote-example').summernote({
						height: 200,
						tabsize: 2,
						codemirror: {
							theme: 'monokai'
						}
					});
				}
				$('#summernote-boxed').switcher({
					on_state_content: '<span class="fa fa-check" style="font-size:11px;"></span>',
					off_state_content: '<span class="fa fa-times" style="font-size:11px;"></span>'
				});
				$('#summernote-boxed').on($('html').hasClass('ie8') ? "propertychange" : "change", function () {
					var $panel = $(this).parents('.panel');
					if ($(this).is(':checked')) {
						$panel.find('.panel-body').addClass('no-padding');
						$panel.find('.panel-body > *').addClass('no-border');
					} else {
						$panel.find('.panel-body').removeClass('no-padding');
						$panel.find('.panel-body > *').removeClass('no-border');
					}
				});
			});
//<-- /. HTML_EDITOR -->

//<-- HIDE/SHOW BUTTON  -->
$(document).ready(function(){
    $("#hide").click(function(){
        $("#btn").hide();
		$("#show").show();
		$("#hide").hide();
		$("#reply").toggle();
    });
    $("#show").click(function(){
        $("#btn").show();
		$("#reply").hide();
		$("#hide").show();
		$("#show").hide();
    });
});
//<-- /. HIDE/SHOW BUTTON  -->

//<-- DATA TABLES -->
$(document).ready(function() {
	$('#example').DataTable();
} );
//<-- /. DATA TABLES  -->

//<-- MAIN JS  -->
	init.push(function () {
		// Javascript code here
	})
	window.PixelAdmin.start(init);
//<-- /. MAIN JS  -->
