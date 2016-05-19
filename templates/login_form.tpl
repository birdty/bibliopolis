<h3 class="page-header">Login</h3>

<form action="/login" method="post">
  <fieldset class="form-group">
    <label for="example_username">Username</label>
    <input type="text" name="username" class="form-control" id="example_username" placeholder="doejohn">
  </fieldset>
  <fieldset class="form-group">
    <label for="example_username">Password</label>
    <input type="password" name="password" class="form-control" id="example_username" placeholder="doejohn">
  </fieldset>

  <input type="hidden" name="account_id" value="2">
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
