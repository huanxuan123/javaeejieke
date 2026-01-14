function ajaxRequest(url, method, data, successCallback, errorCallback) {
    $.ajax({
        url: contextPath + url,
        type: method,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(response) {
            if (response === 'success') {
                successCallback();
            } else {
                if (errorCallback) {
                    errorCallback(response);
                } else {
                    alert('Operation failed: ' + response);
                }
            }
        },
        error: function(xhr, status, error) {
            if (errorCallback) {
                errorCallback('Network error: ' + error);
            } else {
                alert('Network error: ' + error);
            }
        }
    });
}

function showMessage(message, type) {
    var alertClass = type === 'success' ? 'alert-success' : 'alert-danger';
    var alertHtml = '<div class="alert ' + alertClass + ' alert-dismissible fade show" role="alert">' +
                    '<button type="button" class="close" data-dismiss="alert">&times;</button>' +
                    '<strong>' + (type === 'success' ? 'Success! ' : 'Error! ') + '</strong>' +
                    message +
                    '</div>';
    
    $('.alert-container').html(alertHtml);
    
    setTimeout(function() {
        $('.alert').fadeOut('slow', function() {
            $(this).remove();
        });
    }, 3000);
}

function validateForm(formId) {
    var form = $('#' + formId);
    var isValid = true;
    var errorMessage = '';
    
    form.find('input[required], select[required], textarea[required]').each(function() {
        var value = $(this).val();
        if (!value || value.trim() === '') {
            isValid = false;
            var label = $(this).prev('label').text();
            errorMessage += label + ' is required!\n';
            $(this).addClass('error');
        } else {
            $(this).removeClass('error');
        }
    });
    
    if (!isValid) {
        alert(errorMessage);
    }
    
    return isValid;
}

function formatPrice(price) {
    return '$' + parseFloat(price).toFixed(2);
}

function formatDate(date) {
    if (!date) return '';
    var d = new Date(date);
    return d.getFullYear() + '-' + 
           String(d.getMonth() + 1).padStart(2, '0') + '-' + 
           String(d.getDate()).padStart(2, '0');
}

function confirmAction(message) {
    return confirm(message);
}
