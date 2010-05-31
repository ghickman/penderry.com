$(function() {
    /**
     * Attaches a lostFocus event to the given selector and adds a warning div below if the user
     * does not fill in the 
     */
    function not_empty_on_focus_lost(selector) {
        $('#'+selector).blur(function() {
            $('div.'+selector).append('<div class="error">NO NAME</div>')
        });
    }
    
    not_empty_on_focus_lost('name')
    not_empty_on_focus_lost('input.email')
    not_empty_on_focus_lost('input.message')
    
    
    /**
     * Check to see that the email address is valid when focus is lost.
     */
    // if($('input.email').lostFocus()) {
    //         $('input.email').validate()
    //     }
});