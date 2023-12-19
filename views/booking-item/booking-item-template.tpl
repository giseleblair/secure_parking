<template id="template-booking-tabs-item">
    <div class="booking-tabs__item ">
        <div class="booking-tabs__flex-wrapper">
            <div class="booking-tabs__first-section">
                <div class="booking-tabs__icon-wrapper booking-tabs__icon-wrapper--desktop">
                    <div class="booking-tabs__icon booking-tabs__icon--desktop"></div>
                </div>
                <div class="booking-tabs__main-info">
                    <div class="booking-tabs__title">
                        <div class="booking-tabs__icon-wrapper booking-tabs__icon-wrapper--mobile">
                            <div class="booking-tabs__icon booking-tabs__icon--mobile"></div>
                        </div>
                        <span style="display: none;" class="booking-details__cancelled-label">Cancelled </span>
                    </div>
                    <div class="booking-tabs__time">
                        <span></span>
                    </div>
                </div>
            </div>

            <div class="booking-tabs__info-wrapper">
                <div class="booking-tabs__info">

                    <div class="booking-tabs__entry-info"></div>

                </div>
            </div>

        </div>
        <div class="booking-tabs__qr-wrapper">
            <div class="booking-tabs__qr-code"></div>
        </div>

        {{ include booking-details-shared }}
        
    </div>
</template>