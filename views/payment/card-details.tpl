{{include _env}}
<link rel="stylesheet" href="{{$AdvamPaymentGatewayCss}}" />

<form name="payment-form" class="payment-form" method="post" style="display:none">
  <div class="hosted-field-group card-holder">
    <label for="hosted-cardholder-name" class="hosted-field-label required">Cardholder Name</label>
    <div id="hosted-cardholder-name" class="hosted-field">
      <!-- Cardholder name hosted field will be added here. -->
    </div>
    <p id="hosted-cardholder-name-error-message" for="hosted-cardholder-name" class="hosted-field-error-message-hidden"></p>
  </div>
  <div class="hosted-field-group card-number">
    <label for="hosted-card-number" class="hosted-field-label required">Card Number</label>
    <div id="hosted-card-number" class="hosted-field">
      <!-- Card number hosted field will be added here. -->
    </div>
    <p id="hosted-card-number-error-message" for="hosted-card-number" class="hosted-field-error-message-hidden"></p>
  </div>
      <div class="group-row">
  <div class="hosted-field-group expiry-date">
    <label for="hosted-expiry-date" class="hosted-field-label required">Expiry</label>
    <div id="hosted-expiry-date" class="hosted-field">
      <!-- Expiry date hosted field will be added here. -->
    </div>
    <p id="hosted-expiry-date-error-message" for="hosted-expiry-date" class="hosted-field-error-message-hidden"></p>
  </div>
  <div class="hosted-field-group">
    <label for="hosted-cvv" class="hosted-field-label required">CVV</label>
    <div id="hosted-cvv" class="hosted-field">
      <!-- CVV hosted field will be added here. -->
    </div>
    <p id="hosted-cvv-error-message" for="hosted-cvv" class="hosted-field-error-message-hidden"></p>
  </div>
  </div>
  <input name="card-token" id="card-token" type="hidden" />
  <input name="tokenisation-response" class="tokenisation-response" id="tokenisation-response" type="hidden">
  <input name="payment-button" id="payment-button" class="payment-button" type="submit" value="Add card" disabled="disabled">
</form>

<style>

    .cvv-only .hosted-field-group.card-holder,
    .cvv-only .hosted-field-group.card-number,
    .cvv-only .hosted-field-group.expiry-date,
    .cvv-only .hosted-field-group.expiry-date{
        display:none;
    }

    .payment-form {
        padding-bottom: 30px;
    }

    .hosted-field {
        border-radius: 3px;
        border: none;
        height: 58px;
        font-family: 'Noto Sans';
        margin-top: 15px;
        margin-bottom: 25px;
    }

    .hosted-field.hosted-field-invalid {
        border: 2px solid #F54747;
        margin-bottom: 5px;
    }

    .hosted-field-focus {
        box-shadow: none;
    }

    .group-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-gap: 10px;
    }

    #payment-button {
        background-color: #0093d0;
        padding-top: 20px;
        padding-bottom: 20px;
        border-radius: 9999px;
        color: #fff;
        text-align: center;
        font-size: 16px;
        cursor: pointer;
        line-height: 18px;
        font-family: Roboto;
        font-weight: 700;
        margin-top: 25px;
    }

    #payment-button:hover {
        background-color: #0055a5;
        background-color: rgba(0, 85, 165, var(--bg-opacity));
    }

    input#payment-button:disabled {
        opacity: 30%;
    }

    .hosted-field-label {
        font-family: 'Roboto', sans-serif;
        font-weight: 700;
        font-size: 16px;
        line-height: 20px;
        color: #222;
    }

    .hosted-field-label.required::after {
        color: #222;
    }

    .hosted-field-error-message-visible {
        position: static;
        border: none;
        color: #F54747;
        background-color: transparent;
        transform: none;
        margin: 0;
        border-radius: 0px;
        text-align: left;
        margin-bottom: 10px;
        padding-left: 0;
        font-family: 'Noto Sans';
        font-size: 14px;
    }

    .hosted-field-error-message-visible:after {
        content: none;
    }

    @media only screen and (min-width: 1100px) {
        #payment-button {
            font-size: 1.8rem;
        }
    }
</style>

