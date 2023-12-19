<section class="booking-amend__complete-payment" style="display: none;" data-view="finalise-amendment" data-site-panel="amend-payment" data-cart-panel="amend-payment">
    <div class="finalise-amend-payment-components">
        <div class="booking-amend__wrapper new-date">
            {{ include /booking/detailed-description }}
        </div>
        <div class="booking-details__summary">
            <div class="booking-details__summary-title">About your <span class="summary-label">updated booking</span></div>
            <div class="booking-details__summary-rows">
                <div class="booking-details__col">
                    <span class="original-cost-label bays">Original Cost</span>
                    <span class="original-cost"></span>
                </div>
                <div class="booking-details__col booking-fee-container" style="display: none;">
                    <span class="bays booking-fee-label">Booking Fee</span>
                    <span class="booking-fee"></span>
                </div>
                <div class="booking-details__col surcharge-container" style="display: none;"> 
                    <span class="bays surcharge-label">Surcharge</span> 
                    <span class="surcharge"></span> 
                </div> 
                <div class="booking-details__col">
                    <span class="new-cost-label bays">New cost</span>
                    <span class="new-cost"></span>
                </div>
                <div class="booking-details__col giftcard-fee-container" style="display: none;">
                    <div class="gift-card-details__col" style="width: 100%"></div>
                </div>
            </div>
            <div class="booking-details__total">
                <span class="total-change-cost-label">Total change cost</span>
                <span class="total-change-cost"></span>
            </div>
            <div style="display: none;" class="booking-details__gift-card-issue giftcard">
                Your booking changes mean that you are entitled to a credit. A giftcard will be created for you to use towards a future booking.
            </div>
            <div style="display: none;" class="booking-details__gift-card-issue refund">
                Your refund will be applied to the card that was first used to make your booking.
            </div>
            <div style="display: none;" class="booking-details__gift-card-issue special-note">Note: If using Pre-paid debit cards, where refunds are not permitted, please contact us on 02 8000 8790 for support</div>
        </div>
        {{ include /payment/payment-brief }}
    </div>
    {{ include /payments/review-payment }}
    {{ include /account/add-card}}
    <section class="booking-amend__action-buttons complete-payment">
        <div class="booking-amend__btn-container">
            <div class="primary-btn primary-btn--red" data-action="cancel-change">Cancel change</div>
            <div class="booking-total-0 cta-full" style="display: none;">Change booking now</div>
            <div class="cart-payment__book-btn" style="display: none"></div>
        </div>

    </section>
    <section class="booking-amend__action-buttons complete-cancellation">
        <div class="booking-amend__btn-container">
            <div class="primary-btn primary-btn--red" data-action="cancel-change">Cancel change</div>
            <div class="booking-amend__proceed-cancel cta-full">Cancel booking now</div>
        </div>
    </section>
</section>