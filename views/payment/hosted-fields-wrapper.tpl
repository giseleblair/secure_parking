<link rel="stylesheet" href="{{$AdvamPaymentGatewayCss}}"/>
<div class="wrapper">
    <div class="hosted-fields-form-wrapper">
        <div class="hosted-fields__loader-wrapper">
            <div class="lds-ripple loader" style="display: none;">
                <div></div>
                <div></div>
            </div>
        </div>
        <div class="hosted-fields__form-layer"></div>
    </div>
</div>
<style>
    .cvv-only .hosted-field-group.card-holder,
    .cvv-only .hosted-field-group.card-number,
    .cvv-only .hosted-field-group.expiry-date,
    .cvv-only .hosted-field-group.expiry-date {
        display: none;
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
        margin: 0 0 10px;
        border-radius: 0;
        text-align: left;
        padding-left: 0;
        font-family: 'Noto Sans';
        font-size: 14px;
    }
    .hosted-field-error-message-visible:after {
        content: none;
    }
    @media only screen and(min-width: 1100px) {
        #payment-button {
            font-size: 1.8rem;
        }
    }
</style>