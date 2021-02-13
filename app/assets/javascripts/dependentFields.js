(function() {
    var bind, showOrHideDependentFieldsCheckbox, showOrHideDependentFieldsSelect, toggle;
  
    toggle = function($parent, showOrHide, method, duration) {
      if (showOrHide) {
        if (method === 'disable') {
          $parent.find('input,textarea,select,button,.btn').removeAttr('disabled');
          return $parent.find('.select2').select2('enable');
        } else {
          return $parent.show(duration);
        }
      } else {
        if (method === 'disable') {
          $parent.find('input,textarea,select,button,.btn').attr('disabled', 'disabled');
          return $parent.find('.select2').select2('disable');
        } else {
          return $parent.hide(duration);
        }
      }
    };
  
    showOrHideDependentFieldsSelect = function(duration) {
      var $select, showOrHideFields;
  
      if (duration == null) {
        duration = 'fast';
      }
      $select = $(this);
      showOrHideFields = function() {
        var $this, showOrHide;
  
        $this = $(this);
        showOrHide = _.contains($this.attr('data-option-value').split('|'), $select.val());
        return toggle($this, showOrHide, $this.data('method'), duration);
      };
      return $(".js-dependent-fields[data-select-id=" + ($select.attr('id')) + "]").each(showOrHideFields);
    };
  
    showOrHideDependentFieldsCheckbox = function(duration) {
      var $checkbox, showOrHideFields;
  
      if (duration == null) {
        duration = 'fast';
      }
      $checkbox = $(this);
      showOrHideFields = function() {
        var $this, showOrHide;
  
        $this = $(this);
        showOrHide = $this.data('checkbox-value') === $checkbox.is(':checked');
        return toggle($this, showOrHide, $this.data('method'), duration);
      };
      return $(".js-dependent-fields[data-checkbox-id=" + ($checkbox.attr('id')) + "]").each(showOrHideFields);
    };
  
    bind = function() {
      var $inputs, $selects;
  
      $selects = $('select');
      $selects.not('[data-important]').each(_.partial(showOrHideDependentFieldsSelect, 0));
      $selects.filter('[data-important]').each(_.partial(showOrHideDependentFieldsSelect, 0));
      $selects.change(showOrHideDependentFieldsSelect);
      $inputs = $('input[type=checkbox]');
      $inputs.not('[data-important]').each(_.partial(showOrHideDependentFieldsCheckbox, 0));
      $inputs.filter('[data-important]').each(_.partial(showOrHideDependentFieldsCheckbox, 0));
      return $inputs.change(showOrHideDependentFieldsCheckbox);
    };
  
    this.DependentFields = {
      bind: bind
    };
  
  }).call(this);
  
  