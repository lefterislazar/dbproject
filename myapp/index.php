<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>SIGN UP</title>
  </head>
  <body>

<?php
require_once "./db_connect.php";
?>

<p>SIGN UP:</p>
      <form action="./signup_handle.php" method="post">
	<ul>
	    <li>
	      <label for="username">Username:</label>
	      <input type="text" id="username" name="user_name" required />
	    </li>
	    <li>
	      <label for="passwd">Password:</label>
	      <input type="password" id="passwd" name="password" required />
	    </li>
	    <li>
	      <label for="first_name">First Name:</label>
	      <input type="text" id="first_name" name="first_name" required />
	    </li>
	    <li>
	      <label for="last_name">Last Name:</label>
	      <input type="text" id="last_name" name="last_name" required />
	    </li>
	    <li>
	      <label for="birth_date">(Teachers only) Date of birth:</label>
	      <input type="date" id="birth_date" name="birth_date" min="<?php echo date('Y')-75; ?>-01-01" max="<?php echo date('Y')-18; ?>-01-01" />
	    </li>
	    <li>
	      <label for="school_pick">School:</label>
	      <select id="school_pick" name="school_pick">
		<?php
		$result = $mysqli->query("SELECT school_id, school_name FROM school_unit");
		foreach ($result as $row) {
			echo "<option value=\"".$row['school_id']."\">".$row['school_name']." (id: ".$row['school_id'].") </option>\n";
		};
		?>
	      </select>
	    </li>
	    <li>
	      <label for="role">Role:</label>
	<select id="role" name="role">
	  <option>Teacher</option>
	  <option>Student</option>
	  <option>Library Admin</option>
	</select>
	    </li>
	    <li class="button">
	      <button type="submit">Submit registration</button>
	    </li>
	  </ul>
      </form>
<?php
if (isset($_GET['su_success'])) {
  if($_GET['su_success']) {
    echo "Sign-up registration submitted successfully";
  } else {
    echo "Sign-up registration failed";
  }
}
if (isset($_GET['taken_username'])) {
  if($_GET['taken_username']) {
    echo "Username already taken";
  }
}
if (isset($_GET['already_admin'])) {
  if($_GET['already_admin']) {
    echo "School already has admin";
  }
}
if (isset($_GET['no_age'])) {
  if($_GET['no_age']) {
    echo "Set your age";
  }
}
?>

<p>LOGIN:</p>
      <form action="./login_handle.php" method="post">
	<ul>
	    <li>
	      <label for="username">Username:</label>
	      <input type="text" id="username" name="user_name" required />
	    </li>
	    <li>
	      <label for="passwd">Password:</label>
	      <input type="password" id="passwd" name="password" required />
	    </li>
	    <li class="button">
	      <button type="submit">Login</button>
	    </li>
	    <li class="button">
	      <button type="submit" name='central' value=1 >Login as central administrator</button>
	    </li>
	  </ul>
      </form>

<?php
if (isset($_GET['no_user'])) {
  if($_GET['no_user']) {
    echo "Username does not exist";
  }
}

if (isset($_GET['wrong_pass'])) {
  if($_GET['wrong_pass']) {
    echo "Incorrect Password";
  }
}

if (isset($_GET['banned'])) {
    echo "Your account is banned";
}
?>
  </body>
</html>
