
<h3 class="page-header">Add User</h3>

<form action="/users/add" method="post">
  <fieldset class="form-group">
    <label for="example_first_name">First Name</label>
    <input type="text" name="first_name" class="form-control" id="example_first_name" placeholder="John">
  </fieldset>
  <fieldset class="form-group">
    <label for="example_last_name">First Name</label>
    <input type="text" name="last_name" class="form-control" id="example_last_name" placeholder="Doe">
  </fieldset>
  <fieldset class="form-group">
    <label for="example_username">Username</label>
    <input type="text" name="username" class="form-control" id="example_username" placeholder="doejohn">
  </fieldset>
  <fieldset class="form-group">
    <label for="example_email_address">Email Address</label>
    <input type="email" name="email_address" class="form-control" id="example_email_address" placeholder="me@example.com">
  </fieldset>
  <fieldset class="form-group">
    <label for="example_username">Password</label>
    <input type="password" name="password" class="form-control" id="example_username" placeholder="doejohn">
    <small class="text-muted">Must be at least 8 characters and include one upper case, lower case characters. Also include a number and one special character.</small>
  </fieldset>

<!--

  <fieldset class="form-group">
    <label for="exampleSelect1">Example select</label>
    <select class="form-control" id="exampleSelect1">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
  </fieldset>
  <fieldset class="form-group">
    <label for="exampleSelect2">Example multiple select</label>
    <select multiple class="form-control" id="exampleSelect2">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
  </fieldset>
  <fieldset class="form-group">
    <label for="exampleTextarea">Example textarea</label>
    <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
  </fieldset>
  <fieldset class="form-group">
    <label for="exampleInputFile">File input</label>
    <input type="file" class="form-control-file" id="exampleInputFile">
    <small class="text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
  </fieldset>
  <div class="radio">
    <label>
      <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
      Option one is this and that&mdash;be sure to include why it's great
    </label>
  </div>
  <div class="radio">
    <label>
      <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
      Option two can be something else and selecting it will deselect option one
    </label>
  </div>
  <div class="radio disabled">
    <label>
      <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled>
      Option three is disabled
    </label>
  </div>
  <div class="checkbox">
    <label>
      <input type="checkbox"> Check me out
    </label>
  </div>
-->

  <input type="hidden" name="account_id" value="2">
  <button type="submit" class="btn btn-primary">Submit</button>
</form>

<!--

<div class="container-fluid">

  <div class="row">

    <div class="col-xs-12 col-sm-3">
	First Name
    </div>

    <div class="col-xs-12 col-sm-9">
	<input id="first_name" name="first_name" class="form-control" placeholder="John">
    </div>

  </div>

  <div class="row">

    <div class="col-xs-12 col-sm-3">
	Last Name
    </div>

    <div class="col-xs-12 col-sm-9">
	<input id="last_name" name="last_name" class="form-control" placeholder="Doe">
    </div>

  </div>

</div>

<button type="submit" class="btn btn-default">Save</button>

</form>

-->
