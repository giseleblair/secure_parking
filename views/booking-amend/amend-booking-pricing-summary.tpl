<section class="booking-amend__pricing-summary" data-view="pricing-summary" style="display: none;">
    <div class="booking-amend__wrapper new-date">
        {{ include /booking/detailed-description }}
    </div>
    {{ include /cart/gift-card }}
    <div class="booking-details__summary">
        <div class="booking-details__summary-title">About your <span class="summary-label">updated booking</span></div>
        <div class="booking-details__summary-rows">
            <div class="booking-details__col">
                <span class="bays original-cost-label">Original Cost</span>
                <span class="original-cost"></span>
            </div>
            <div class="booking-details__col booking-fee-container" style="display: none;"> 
                <span class="bays booking-fee-label">Booking Fee</span> 
                <span class="booking-fee"></span> 
            </div>
            <div class="booking-details__col surcharge-container" style="display: none;"> 
                <span class="bays surcharge-label">Surcharge</span> 
                <span class="surcharge">blh</span> 
            </div> 
            <div class="booking-details__col">
                <span class="bays new-cost-label">New cost</span>
                <span class="new-cost"></span>
            </div>
            <div class="gift-card-details__summary">
                <div class="gift-card-details__col"></div>
            </div>
        </div>
        <div class="booking-details__total">
            <span class="total-change-cost-label">Total change cost</span>
            <span class="total-change-cost"></span>
        </div>
        <div style="display: none;" class="booking-details__gift-card-issue giftcard">Your booking changes mean that you are entitled to a credit. A giftcard will be created for you to use towards a future booking.</div>
        <div style="display: none;" class="booking-details__gift-card-issue refund">Your refund will be applied to the card that was first used to make your booking.</div>
        <div style="display: none;" class="booking-details__gift-card-issue special-note">Note: If using Pre-paid debit cards, where refunds are not permitted, please contact us on 02 8000 8790 for support</div>
    </div>
    <section class="booking-amend__action-buttons payment-summary">
        <div class="booking-amend__btn-container">
            <div class="primary-btn primary-btn--red" data-action="cancel-change">Cancel change</div>
            <div class="primary-btn booking-amend__proceed-payment">Proceed to payment</div>
            <div class="booking-amend__proceed-cancel cta-full" style="display:none;">Cancel booking now</div> 
        </div>
    </section>
</section>