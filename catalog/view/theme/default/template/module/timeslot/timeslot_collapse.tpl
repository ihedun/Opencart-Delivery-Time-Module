<p class="description">Please select the preferred Date to use on this order</p>     
            <div class="intervals">
             <div class="radio-input radio">
                
                 <input type="hidden" name='last_id' id="last_id" value="<?php echo $Intervals['last_id'][0]?>" />
                 <input type="hidden" name='start_id' id="start_id" value="<?php 
                        if(isset($Intervals['start_id'][0])){
                        echo $Intervals['start_id'][0];
                        
                        }
                        
                        ?>" />
                          
                  <select name="delivery_slot_time" class="form-control" id='slots' onchange="selectDate(this.value)">  
                      <option>Select</option>
                      <?php foreach($Intervals as $val){ 
                      $exp = explode(" ",$val); 
                      if($exp[0]!="")
                      {
                      ?>
                      <option value="<?php echo $exp[0]?>"><?php echo $exp[0]?></option> 
                     <?php 
                     }
                      } ?>
                  
                  </select> 
                 <div id="error_max_slot"><p><br>Please select another slot because this time is full</p></div>
                 
                 
                 <div id="timess"></div>
                 
               
           
             </div>
             </div>
            
           <input type="button" value="Continue" id="button-interval" data-loading-text="Loading..." class="btn btn-primary">
               
           
    <script>
    
    $("#error_max_slot").css("display","none");
    $("#button-interval").css("display","none");
    
    function selectDate(times){
        
       
    var dat = $("#last_id").val();
    var start = $("#start_id").val();
    $.ajax({
		url: 'index.php?route=module/timeslot/timeslot/getDates/',
		type: 'post',
                data: { SearchTime: times,last_id:dat, start_id:start },
                dataType: 'html',
		beforeSend: function() {
		//	$('#recurring-description').html('');
		},
		success: function(result) {
               
              
                if(result=="false"){
                    
                $("#timess").css("display","none");           
                $("#button-interval").css("display","none");
                
        } else{   
                $("#timess").css("display","block");     
                $("#timess").html(result);
                $("#button-interval").css("display","block");}
		}
	});
    }
    
           
    </script>       
        <!-----------End--------------------->