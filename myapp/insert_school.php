<?php
include_once "header.php";
require_once "./db_connect.php";

if($_SESSION['role']!='CENTRAL_ADMIN' ) {
	header('Location: ./main.php');
	exit();
}
?>

<h2>Insert School</h2>


<form action="./insert_school_handle.php" method="post">
<p>School ID:
<input type="text" id='school_id' name='school_id' minlength=7 maxlength=7 placeholder='7 digit id' required/>
<p>School Name:
<input type="text" id='school_name' name='school_name' required/>
<p>City: 
<input type="text" id='city' name='city' required/>
</p>
<p>Address: 
<input type="text" id='address' name='address' required/>
</p>
<p>Zip code: 
<input type="text" id='zip' name='zip' minlength=5 maxlength=5 required/>
</p>
<p>Phone Number (seperate multiple by commas): <br>
<input type="tel" id="add_phone" name="add_tel" required/>	
</p>
<p>Email (seperate multiple by commas): <br>
<input type="email" id="add_email" name="add_email" required multiple>	
</p>
<button type="submit">Submit</button>
</form>


<?php
if(isset($_GET['success'])) { ?>
	<p>School inserted successfuly</p>
<?php
}

