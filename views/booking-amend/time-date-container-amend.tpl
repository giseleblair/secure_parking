<section data-view="time-date-picker" style="display: none;">
    <div class="booking-amend__wrapper current-date">
        {{ include /booking/detailed-description }}
    </div>
    {{ include /booking-amend/amend-booking-time-date }}

    <div class="booking-amend__wrapper new-date">

        {{ include /booking/detailed-description }}
    </div>

    <section class="booking-amend__action-buttons amendment-step">

        <div class="booking-amend__btn-container">
            <div class="primary-btn primary-btn--red" data-action="cancel-change">Cancel change</div>
            <div class="primary-btn booking-amend__proceed-payment">Confirm change</div>
        </div>

    </section>

        <section class="booking-amend__action-buttons cancel-step" style="display:none;">

        <div class="booking-amend__btn-container">
            <div class="primary-btn primary-btn--red" data-action="cancel-change">Cancel change</div>
            <div class="primary-btn booking-amend__cancel-confirm">Cancel booking</div>
        </div>

    </section>


</section>