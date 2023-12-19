{{ include _env }}
<section class="add-new-vehicle">
    <div class="wrapper">
        <div class="add-new-vehicle__breadcrumb">
            <span></span>
            <div>Back</div>
        </div>
        {{if {this.set_zuid} == {$addNewVehiclePageId} }}
                <h1 class="add-new-vehicle__main-title">Add new vehicle</h1>
        {{else}}
                <h2 class="add-new-vehicle__main-title">Add new vehicle</h2>
        {{end-if}}
        
        <p class="add-new-vehicle__desc">Add another vehicle to your account for easier billing and lot access.</p>

        <div class="add-new-vehicle__vehicle-field add-new-vehicle__vehicle-field-license">
            <label for="vehicleNumber" class="required">License Plate Number</label>
            <div class="add-new-vehicle__input-wrapper">
                <input type="text" id="vehicleNumber" name="vehicleNumber" placeholder="e.g. P4RK3R">
                <div class="add-new-vehicle__input-decor add-new-vehicle__input-decor--one"></div>
                <div class="add-new-vehicle__input-decor add-new-vehicle__input-decor--two"></div>
                <div class="add-new-vehicle__input-decor add-new-vehicle__input-decor--three"></div>
                <div class="add-new-vehicle__input-decor add-new-vehicle__input-decor--four"></div>
            </div>
            <span class="error" data-error-for="vehicleNumber"></span>
        </div>

        <div class="add-new-vehicle__items">
            <div class="add-new-vehicle__subtitle">Vehicle type</div>
            <input name="vehicleType" hidden>
            <div class="add-new-vehicle__tab-item sedan">
                <div>
                    <div class="add-new-vehicle__icon-wrapper">
                        <div class="add-new-vehicle__icon add-new-vehicle__icon--sedan"></div>
                    </div>
                </div>
                <div class="add-new-vehicle__info">
                    <div class="add-new-vehicle__title">
                        <div class="add-new-vehicle__name">Sedan (1.8 metres or less)</div>
                    </div>
                    <div class="add-new-vehicle__vehicle-details">
                        <span class="add-new-vehicle__vehicle-type">Most small and family cars</span>
                    </div>
                </div>
            </div>

            <div class="add-new-vehicle__tab-item fwd">
                <div>
                    <div class="add-new-vehicle__icon-wrapper">
                        <div class="add-new-vehicle__icon add-new-vehicle__icon--fwd"></div>
                    </div>
                </div>
                <div class="add-new-vehicle__info">
                    <div class="add-new-vehicle__title">
                        <div class="add-new-vehicle__name">Large 4WD (2 metres)</div>
                    </div>
                    <div class="add-new-vehicle__vehicle-details">
                        <span class="add-new-vehicle__vehicle-type">4WD and some Utes</span>
                    </div>
                </div>
            </div>

            <div class="add-new-vehicle__tab-item truck">
                <div>
                    <div class="add-new-vehicle__icon-wrapper">
                        <div class="add-new-vehicle__icon add-new-vehicle__icon--truck"></div>
                    </div>
                </div>
                <div class="add-new-vehicle__info">
                    <div class="add-new-vehicle__title">
                        <div class="add-new-vehicle__name">Van (over 2.2 metres)</div>
                    </div>
                    <div class="add-new-vehicle__vehicle-details">
                        <span class="add-new-vehicle__vehicle-type">Van (over 2.2 metres)</span>
                    </div>
                </div>
            </div>

        </div>

        <div class="add-new-vehicle__vehicle-field">
            <label for="vehicleNickname" class="required">Vehicle Nickname</label>
            <input type="text" id="vehicleNickname" name="vehicleNickname" placeholder="e.g. Jim's Beetle">
            <span class="error" data-error-for="vehicleNickname"></span>
        </div>

        <div class="add-new-vehicle__default primary-vehicle">
            <div class="add-new-vehicle__default-type">
                <div class="add-new-vehicle__primary-title">Primary Vehicle</div>
                <div class="add-new-vehicle__instruction">Set as your primary vehicle for fast booking</div>
            </div>
            <div class="add-new-vehicle__switch">
                <label class="switch">
                    <input type="checkbox" data-switch-name="isDefault">
                    <span class="slider round"></span>
                </label>
            </div>
        </div>

    </div>
    <div class="add-new-vehicle__bottom-section">
        <div class="add-new-vehicle__add-btn new">
            <div class="cta-full">Add vehicle</div>
        </div>
        <div class="add-new-vehicle__add-btn update" style="display: none;">
            <div class="cta-full">Update vehicle</div>
        </div>
    </div>
    <div class="add-new-vehicle__loader-wrapper">
        <div class="lds-ripple loader" style="display: none;">
            <div></div>
            <div></div>
        </div>
    </div>
</section>