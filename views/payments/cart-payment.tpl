<section class="cart-payment" data-cart-panel="payment">
   <div class="wrapper">
      <h2 class="payment-title">Payment</h2>
      <p class="promo-notification">Click "&lt; Back" to add a promotional code</p>
      {{ include /payment/payment-brief }}
      <div class="cart-payment__items"></div>
      <div class="cart-payment__total">
         <span>Total</span>
         <span class="total">$ERR</span>
      </div>
   </div>
   {{ include /booking/booking-details-terms }} 
   {{ include /payments/bluetooth-gate }} 
   <div class="cart-payment__book-btn">
      
   </div>
</section>
<div class="checkout-manage-cards">
   {{ include /payments/review-payment }}
   {{ include /account/add-card }}
</div>