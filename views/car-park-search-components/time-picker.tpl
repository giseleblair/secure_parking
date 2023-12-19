<section class="carpark-search__time-picker" data-searchShowId="search-time-picker">

    <input type="hidden" placeholder="hours enter before" class="hoursEnterBefore">
    <input type="hidden" placeholder="minutes enter before" class="minutesEnterBefore">
    <input type="hidden" placeholder="am-pm-enter" class="am-pm-enter" value="AM">
    <input type="hidden" placeholder="hours exit after" class="hoursExitAfter">
    <input type="hidden" placeholder="minute exit after" class="minutesExitAfter">
    <input type="hidden" placeholder="am-pm-exit" class="am-pm-exit" value="PM">

    <div class="container">
        <div class="custom-time-pickers">
            
            <div class="custom-timepicker enter-before">
                <label>Enter after</label>
                <div class="custom-timepicker__wrapper">

                    <div class="hours-picker-wrapper">
                        <div class="swiper-button-prev hours"></div>
                        <div class="swiper hours">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">01</div>
                                <div class="swiper-slide">02</div>
                                <div class="swiper-slide">03</div>
                                <div class="swiper-slide">04</div>
                                <div class="swiper-slide">05</div>
                                <div class="swiper-slide">06</div>
                                <div class="swiper-slide">07</div>
                                <div class="swiper-slide">08</div>
                                <div class="swiper-slide">09</div>
                                <div class="swiper-slide">10</div>
                                <div class="swiper-slide">11</div>
                                <div class="swiper-slide">12</div>
                            </div>
                        </div>
                        <div class="swiper-button-next hours"></div>
                    </div>
                    <div class="custom-timepicker__separator">:</div>
                    <div class="minutes-picker-wrapper">
                        <div class="swiper-button-prev minutes"></div>
                        <div class="swiper minutes">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">00</div>
                                <div class="swiper-slide">15</div>
                                <div class="swiper-slide">30</div>
                                <div class="swiper-slide">45</div>
                            </div>
                        </div>
                        <div class="swiper-button-next minutes"></div>
                    </div>
                    <div class="time-switch">
                        <div class="time-switch__tab am" data-direction="enter" data-period="AM">AM</div>
                        <div class="time-switch__tab pm" data-direction="enter" data-period="PM">PM</div>
                    </div>
                </div>
            </div>

            <div class="custom-timepicker exit-after">
                <label>Exit before</label>
                <div class="custom-timepicker__wrapper">
                    <div class="hours-picker-wrapper">
                        <div class="swiper-button-prev hours"></div>
                        <div class="swiper hours">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">01</div>
                                <div class="swiper-slide">02</div>
                                <div class="swiper-slide">03</div>
                                <div class="swiper-slide">04</div>
                                <div class="swiper-slide">05</div>
                                <div class="swiper-slide">06</div>
                                <div class="swiper-slide">07</div>
                                <div class="swiper-slide">08</div>
                                <div class="swiper-slide">09</div>
                                <div class="swiper-slide">10</div>
                                <div class="swiper-slide">11</div>
                                <div class="swiper-slide">12</div>
                            </div>
                        </div>
                        <div class="swiper-button-next hours"></div>
                    </div>
                    <div class="custom-timepicker__separator">:</div>

                    <div class="minutes-picker-wrapper">
                        <div class="swiper-button-prev minutes"></div>
                        <div class="swiper minutes">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">00</div>
                                <div class="swiper-slide">15</div>
                                <div class="swiper-slide">30</div>
                                <div class="swiper-slide">45</div>
                            </div>
                        </div>
                        <div class="swiper-button-next minutes"></div>
                    </div>
                    <div class="time-switch">
                        <div class="time-switch__tab am" data-direction="exit" data-period="AM">AM</div>
                        <div class="time-switch__tab pm" data-direction="exit" data-period="pm">PM</div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>