<section class="receipt-activity logged-in">
    <div class="wrapper">
        <h1>Activity Statement</h1>
        <div class="receipt-activity__header">
            <div class="receipt-activity__cotnainer">
                <h3 class="receipt-activity__label">From</h3>
                <div class="receipt-activity__selector">
                    <select class="receipt-activity__date-selector from-month"></select>
                    <select class="receipt-activity__date-selector from-year"></select>
                </div>
            </div>
            <div class="receipt-activity__cotnainer">
                <h3 class="receipt-activity__label">To</h3>
                <div class="receipt-activity__selector">
                    <select class="receipt-activity__date-selector to-month"></select>
                    <select class="receipt-activity__date-selector to-year"></select>
                </div>
            </div>
        </div>
        <div class="receipt-activity__error" style="display: none;">Please review your date selections and ensure they are valid.</div>
        <!-- loading symbol -->
        <div class="booking-tabs__loader-wrapper">
            <div class="lds-ripple loader" style="display: none;">
                <div></div>
                <div></div>
            </div>
        </div>
        <div class="receipt-activity__buttons">
            <div class="receipt-activity__total">
                <span class="receipts-total"></span></div>
        </div>
        <div class="receipt-activity__name"></div>
        <div class="receipt-activity__bookings-list">
            <!-- append receipt bookings here -->
        </div>
        <div class="receipt-activity__bookings-list-empty" style="display: none;">
            No receipt activity found
        </div>
    </div>
</section>

<div class="receipt-activity__guest booking-tabs__guest guest" style="display: none;">
    <div class="wrapper">
        <div class="booking-tabs__guest-content">
            <div class="booking-tabs__guest-title">Create an account or sign in to view your activity</div>
            <div class="cta-full login-link">
                Sign in or register
            </div>
        </div>
    </div>
</div>