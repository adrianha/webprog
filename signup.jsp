
<h1>Registration</h1>
<hr />
<form method="post"/>
<legend>
<fieldset><h3><b>Sign up Form</b></h3>
<table border="0">
	<tr>
		<td>Username</td><td>:</td>
		<td><input type="text" name="usrusrName"></td>
	</tr>
	<tr>
		<td>Password</td><td>:</td>
		<td><input type="password" name="pwd"></td>
	</tr>
	<tr>
		<td>Verify Password</td><td>:</td>
		<td><input type="password" name="verpwd"></td>
	</tr>
	<tr>
		<td>Name</td><td>:</td>
		<td><input type="text" name="usrName"></td>
	</tr>
	<tr>
		<td>Nickname</td><td>:</td>
		<td><input type="text" name="usrNickName"></td>
	</tr>
	<tr>
		<td>Email</td><td>:</td>
		<td><input type="text" name="usrmail"></td>
	</tr>
	<tr>
		<td>Gender</td><td>:</td>
		<td><input type="radio" name="male" value="Male">Male <input type="radio" name="male" value="Female">Female</td>
	</tr>
	<tr>
		<td>Birthdate</td><td>:</td>
		<td>
			<select>
				<option value="none">Month:</option>
				<option value="1">Jan</option>
				<option value="2">Feb</option>
				<option value="3">Mar</option>
				<option value="4">Apr</option>
				<option value="5">May</option>
				<option value="6">Jun</option>
				<option value="7">Jul</option>
				<option value="8">Aug</option>
				<option value="9">Sep</option>
				<option value="10">Oct</option>
				<option value="11">Nov</option>
				<option value="12">Dec</option>
			</select>
			<select>
				<option value="none">Day:</option>
			</select>
			<select>
				<option value="none">Year:</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>Birthplace</td><td>:</td>
		<td><input type="text" name="birthplace"></td>
	</tr>
	<tr>
		<td colspan="3" align="center"/>
			<input type="submit" id="signup" name="signup" value="Sign Up"/>
		</td>
	</tr>
</table>
</form>
</fieldset>
</legend>