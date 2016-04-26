{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login"}

<div id="main-content" class="page page_login">

	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login"}

	{if $loginMessage}
	<p>
		{translate key=$loginMessage}
	</p>
	{/if}

	{if $implicitAuth}
	<a id="implicitAuthLogin" href="{url page="login" op="implicitAuthLogin"}">{translate key="user.login"}</a>
	{else}
	<script>
		$(function() {ldelim}
			// Attach the form handler.
			$('#login').pkpHandler(
				'$.pkp.controllers.form.FormHandler',
				{ldelim}
					trackFormChanges: false
				{rdelim});
		{rdelim});
	</script>

	<form class="pkp_form login" id="login" method="post" action="{$loginUrl}">
	{/if}

  	{if $error}
  	<p class="bg-warning">
  		{translate key=$error reason=$reason}
  	</p>
  	{/if}

		<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />

		{if !$implicitAuth}

    <div class="form-group">
      <label for="login-username">{translate key="user.username"}</label>
      <input type="text" class="form-control" id="login-username" placeholder="{translate key='user.username'}" value="{$username|escape}" maxlenght="32" required>
    </div>

    <div class="form-group">
      <label for="login-password">{translate key="user.password"}</label>
      <input type="password" class="form-control" id="login-password" placeholder="{translate key='user.password'}" password="true" maxlength="32" required="$passwordRequired">
    </div>

    <div class="form-group">
      <a href="{url page="login" op="lostPassword"}">
        {translate key="user.login.forgotPassword"}
      </a>
    </div>

    <div class="checkbox">
      <label>
        <input type="checkbox" name="remember" id="remember" value="1" checked="$remember"> {translate key="user.login.rememberUsernameAndPassword"}
      </label>
    </div>

    <p>
      <button type="submit" class="btn btn-primary">{translate key="user.login"}</button>
      {if !$hideRegisterLink}
      {url|assign:registerUrl page="user" op="register" source=$source}
      <a class="btn btn-default register-button" href="{$registerUrl}" role="button">{translate key="user.login.registerNewAccount"}</a>
      {/if}
    </p>

		{/if}{* !$implicitAuth *}
	</form>

</div><!-- .page -->

{include file="common/frontend/footer.tpl"}
