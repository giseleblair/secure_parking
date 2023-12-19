<section class="account-payments-mobile open logged-in" data-site-panel="mobile-account-card">
    <div class="account-menu-overlay"></div>
    <div class="wrapper">
        <div class="manage-payment__breadcrumb account-back">
            <span></span> 
            <a href="{{$langPrefix}}/account">Account</a>
        </div>
         <div class="manage-payment__breadcrumb payment-methods-back" style="display: none;">
            <span></span> 
            <a class="">Payment Methods</a>
        </div>
        <div class="cards-menu breadcrumb" style="display: none;">
            <span></span>Back
        </div>
    </div>
    <div class="account-manage-cards">
        {{ include /payments/review-payment }}
        {{ include /account/edit-card}}
    </div>
    <div class="add-card--mobile-page">
        {{ include /account/add-card }}
    </div>
</section>
      <div class="receipt-activity__guest booking-tabs__guest guest">
            <div class="wrapper">
                <div class="booking-tabs__guest-content">
                    <div class="booking-tabs__guest-title">Create an account or sign in to view your payment methods.</div>
                    <div class="cta-full login-link">
                Sign in or register
            </div>
                </div>
            </div>
        </div>