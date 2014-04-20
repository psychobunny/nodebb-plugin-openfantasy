<form>
<br />
<table class="table" width="100%" border="2" cellspacing="1" cellpadding="3" align="center">
	<tr>
		<th align="center" >[[of:vault_page_name]]</th>
	</tr>
	<tr>
		<td class="row2" align="center" colspan="3" ><span class="gen">[[of:vault_opened_accounts]] : {accounts}</span> </td>
	</tr>
	<tr>
		<td class="row2" align="center" colspan="3" ><span class="gen">[[of:vault_accounts_sum]] : {total_deposit} {l_points}</span> </td>
	</tr>
</table>
<br clear="all" />

<!-- IF blacked -->
<table class="table" width="100%" border="2" cellspacing="1" cellpadding="3" align="center">
	<tr>
		<th align="center" >{L_BLACK_LISTED}</th>
	</tr>
	<tr>
		<td class="row1" align="center" ><span class="gensmall">{L_BLACK_LISTED_EXPLAIN}</span> </td>
	</tr>	
	<tr>
		<td class="row2" align="center" ><span class="gen">{L_BLACK_LISTED_DUE} : {DUE} {l_points}</span> </td>
	</tr>
	<tr>
		<td class="row3" align="center" ><input type="hidden" name="due" value="{DUE}"><input type="submit" value="{L_DUE_PAYOFF}" name="due_payoff" class="mainoption" /></td>
	</tr>
</table>
<!-- ENDIF blacked -->

<!-- IF account -->
<br />
<table class="table" width="100%" border="2" cellspacing="1" cellpadding="3" align="center">
	<tr>
		<th align="center" >{L_PERSONAL_INFORMATIONS}</th>
	</tr>
	<tr>
		<td class="row2" align="center" ><span class="gen">{L_OWNER_POINTS} : {POINTS} {l_points}</span> </td>
	</tr>
	<tr>
		<td class="row2" align="center" ><span class="gen">{L_ACCOUNT} : {ACCOUNT_SUM} {l_points}</span> </td>
	</tr>
	<tr>
		<td class="row3" align="center" ><input type="submit" value="{L_CLOSE_ACCOUNT}" name="close" class="mainoption" /></td>
	</tr>
</table>
<br clear="all" />
<table class="table" width="100%" border="2" cellspacing="1" cellpadding="3" align="center">
	<tr>
		<th align="center" colspan="3" >{L_ACCOUNT_INFORMATIONS}</th>
	</tr>
	<tr>
		<td class="row2" align="center" ><span class="gen">{L_INTEREST_RATE}</span> </td>
		<td class="row1" align="center" colspan="2" ><span class="gen">{INTEREST_RATE} %</span></td>
	</tr>
	<tr>
		<td class="row2" align="center" ><span class="gen">{L_INTEREST_TIME}</span> </td>
		<td class="row1" align="center" colspan="2" ><span class="gen">{INTEREST_TIME}</span></td>
	</tr>
	<tr>
		<td class="row1" width="50%" align="center"><span class="gen">{L_ACCOUNT_DEPOSIT}</span></td>
		<td class="row2" align="center"><input class="post" type="text" value="{POINTS}" class="post" maxlength="8" size="8" name="deposit_sum" /><span class="gensmall"> {l_points}</span></td>
		<td class="row3" align="center"><input type="submit" value="{L_DEPOSIT}" name="deposit" class="liteoption" /></td>
	</tr>
	<tr>
		<td class="row1" width="50%" align="center"><span class="gen">{L_ACCOUNT_WITHDRAW}</span></td>
		<td class="row2" align="center"><input class="post" type="text" value="{ACCOUNT_SUM}" class="post" maxlength="8" size="8" name="withdraw_sum" /> <span class="gensmall"> {l_points}</span></td>
		<td class="row3" align="center"><input type="submit" value="{L_WITHDRAW}" name="withdraw" class="liteoption" /></td>
	</tr>

</table>
	<!-- IF loan_authed -->
	<br clear="all" />
	<table class="table" width="100%" border="2" cellspacing="1" cellpadding="3" align="center">
		<tr>
			<th align="center" colspan="4">{L_LOAN_INFORMATIONS}</th>
		</tr>
		<!-- IF no_loan -->
		<tr>
			<td class="row2" align="center" ><span class="gen">{L_NO_LOAN_EXPLAIN} {POSTS_REQ} {L_POSTS_REQ}</span> </td>
		</tr>
		<!-- ENDIF no_loan -->
		<!-- IF active_loan -->
		<tr>
			<td class="row2" align="center" colspan="4"><span class="gen">{L_LOAN_ACTIVE}</span> </td>
		</tr>
		<tr>
			<td class="row1" width="25%" align="center"><span class="gen"><b>{L_LOAN_SUM}</b></span></td>
			<td class="row1" width="25%" align="center"><span class="gen"><b>{L_LOAN_REMAINING_TIME}</b></span></td>
			<td class="row1" width="25%" align="center"><span class="gen"><b>{L_LOAN_REMAINING_DATE}</b></span></td>
			<td class="row1" width="25%" align="center"><span class="gen"><b>{L_LOAN_LOAN}</b></span></td>
		</tr>
		<tr>
			<td class="row2" width="25%" align="center"><span class="gen">{LOAN_SUM} {l_points}</span></td>
			<td class="row2" width="25%" align="center"><span class="gen">{LOAN_REMAINING_TIME}</span></td>
			<td class="row2" width="25%" align="center"><span class="gen">{LOAN_REMAINING_DATE}</span></td>
			<td class="row2" width="25%" align="center"><span class="gen">{LOAN_LOAN} {l_points}</span></td>
		</tr>
		<tr>
			<td class="row3" align="center" colspan="4"><input type="submit" value="{L_LOAN_BACK}" name="loan_back" class="mainoption" /></td>
		</tr>
		<!-- ENDIF active_loan -->
		<!-- IF loan -->
		<tr>
			<td class="row2" align="center" ><span class="gen">{L_LOAN_RATE}</span> </td>
			<td class="row1" align="center" colspan="2" ><span class="gen">{LOAN_RATE} %</span></td>
		</tr>
		<tr>
			<td class="row2" align="center" ><span class="gen">{L_LOAN_TIME}</span> </td>
			<td class="row1" align="center" colspan="2" ><span class="gen">{LOAN_TIME}</span></td>
		</tr>
		<tr>
			<td class="row2" align="center" ><span class="gen">{L_LOAN_MAX_SUM}</span> </td>
			<td class="row1" align="center" colspan="2" ><span class="gen">{LOAN_MAX_SUM} {l_points}</span></td>
		</tr>
		<tr>
			<td class="row1" width="50%" align="center"><span class="gen">{L_ACCOUNT_LOAN}</span></td>
			<td class="row2" align="center"><input class="post" type="text" class="post" maxlength="8" size="8" name="loan_sum" /><span class="gensmall"> {l_points}</span></td>
			<td class="row3" align="center"><input type="submit" value="{L_LOAN}" name="loan" class="liteoption" /></td>
		</tr>
		<!-- ENDIF loan -->
	</table>
	<!-- ENDIF loan_authed -->
<!-- ENDIF account -->

<!-- IF !account -->
<table class="table" width="100%" border="2" cellspacing="1" cellpadding="3" align="center">
	<tr>
		<th align="center" >[[of:vault_user_informations]]</th>
	</tr>
	<tr>
		<td class="row2" align="center" ><span class="gen">[[of:vault_user_points]] : {character_points} {l_points}</span> </td>
	</tr>
	<tr>
		<td class="row2" align="center" ><span class="gen">[[of:vault_no_account]]</span> </td>
	</tr>
	<tr>
		<td class="row3" align="center" ><button class="btn btn-primary btn-block btn-open">[[of:vault_open_account]]</button></td>
	</tr>
</table>
<!-- ENDIF !account -->
</form>
<br clear="all" />




<script type="text/javascript">
	$('.btn-open').on('click', function() {
		bootbox.alert("Sorry we're closed, come back soon!");
		return false;
	});
	
	$('document').ready(function() {
		$('.rpg-header li').removeClass('active');
		$('.rpg-header .vault').addClass('active');
	});
</script>