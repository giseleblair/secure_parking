

<section class="vehicles-list" data-account-section="vehicles-list">
   
    <div class="wrapper vehicles-list__top-section logged-in">
        <div class="account-form__breadcrumb">
            <span></span>
            <a href="{{$langPrefix}}/account">Account</a>
        </div>
        <h2 class="vehicles-list__main-title">Vehicles</h2>
        <p class="vehicles-list__desc">Vehicles listed here will be billed to your selected primary method.</p>
        <div class="vehicles-list__loader-wrapper">
        {{ include /misc/loader }}
        </div>
        <div class="vehicles-list__empty" style="display: none;">
            Your vehicle list is empty - add a new one below.
        </div>

  

        <div class="vehicles-list__items"></div>
    </div>
    <div class="vehicles-list__bottom-section logged-in">
        <div class="vehicles-list__add-btn">
            <div class="cta-full">Add new vehicle</div>
        </div>
    </div>
</section>
<!-- Vehicle List Item Template -->
<template data-id="template-vehicle-list-item">
    <div class="vehicles-list__tab-item" data-name="" data-type="" data-license-plate="" data-vehicle-id="">
        <div>
            <div class="vehicles-list__icon-wrapper">
                <div class="vehicles-list__icon" data-id="icon"></div>
            </div>
        </div>
        <div class="vehicles-list__info">
            <div class="vehicles-list__title">
                <div class="vehicles-list__name" data-id="name"></div>
                <div class="vehicles-list__default" data-id="isDefault"></div>
            </div>
            <div class="vehicles-list__vehicle-details">
                <span class="vehicles-list__number-plate" data-id="licensePlate"></span>
                <span class="vehicles-list__vehicle-type" data-id="type"></span>
            </div>
        </div>
    </div>
</template>
{{ include /vehicles/vehicle-list-item }}

{{ include /vehicles/add-new-vehicle }}

<style>
      .lds-ripple div {
        border: 4px solid #0055a5;
      }
</style>