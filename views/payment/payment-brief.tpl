<div class="cart-payment__elements-wrapper loading">
    <div class="loader">
        <div class="lds-ripple">
            <div></div>
            <div></div>
        </div>
    </div>
    <div
        class="element-wrapper" style="display: none;">
        <!-- Message bried -->
        <div class="cart-payment__message-brief cart-payment__summary" style="display: none">
            <div class="wrapper">
                <div class="message"></div>
            </div>
        </div>
        <!-- Card found - select card -->
        <div class="cart-payment__card-info" data-cart-payment-type="select-card" style="display: none">
            <div class="cart-payment__icon"></div>
            <div class="cart-payment__info">
                <div class="cart-payment__title"></div>
            </div>
        </div>
        <!-- card found - CVV field addition -->
        <div class="payment-form-location cvv-only" data-payment-wrapper="payment-form-wrapper" style="display: none"></div>
        <!-- No card found - add a card -->
        <div class="cart-payment__card-info" data-cart-payment-type="add-or-update-card" style="display: none">
            <div class="cart-payment__icon"></div>
            <div class="cart-payment__info">
                <div class="cart-payment__title"></div>
            </div>
        </div>
    </div>
</div>