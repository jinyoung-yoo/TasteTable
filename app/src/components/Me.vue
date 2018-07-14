<template>
  <div class='container'>
    <div class='row'>
      <div class='col-xs-12 col-sm-8 col-sm-push-2'>
        <h1 class='text-center'>Me</h1>
        <hr/>
        <br/>
      </div>
    </div>
    <div id='petsRow' class='row'>
      <div class='col-sm-6 col-sm-push-3 col-md-4 col-md-push-4'>
        <div class='panel panel-default'>
          <div class='panel-heading'>
            <h3 class='panel-title'>My Wallet</h3>
            <sub>{{account}}</sub>
          </div>
          <div class='panel-body'>
            <h4>Balance</h4>
            <strong>Balance</strong>: <span id='TTBalance' v-html='balance'></span> TT<br/><br/>
            <h4>Transfer</h4>
            <input type='text' class='form-control' id='TTTransferAddress' v-model='toAddress' placeholder='Address' />
            <input type='text' class='form-control' id='TTTransferAmount' v-model='toAmount' placeholder='Amount' />
            <button class='btn btn-primary' id='transferButton' type='button' @click.prevent='makeTransfer()'>Transfer</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'Wallet'
}
</script>
<style lang='css' scoped>
</style>