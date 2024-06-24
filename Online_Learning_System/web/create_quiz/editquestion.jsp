<%-- 
    Document   : EditProductModal
    Created on : Mar 12, 2024, 4:02:42 PM
    Author     : hatro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : canswer
    Created on : Jun 17, 2024, 5:46:27 PM
    Author     : hatro
--%>
<div class="modal fade" id="editQuestionModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h5 class="modal-title">Edit Question</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editQuestionForm" action="question?action=edit" method="POST">
                    <div class="form-group row">
                        <label for="questionNoInput" class="col-form-label col-md-3">Question No:</label>
                        <div class="col-md-9">
                            <input type="number" min="1" max="200" class="form-control" id="questionNoEditInput" name="number">
                            <div id="questionNoEditError" class="error"></div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="titleInput" class="col-form-label col-md-3">Title:</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="titleEditInput" name="title">
                            <div id="titleEditError" class="error"></div>
                        </div>
                    </div>
                    <div class="form-group row" hidden="">
                        <label for="typeQuestion" class="col-form-label col-md-3">Type:</label>
                        <div class="col-md-4">
                            <select class="custom-select" id="typeQuestion" name="typeQuestion" onchange="updateAnswerType()">
                                <option value="checkBox">Check Box</option>
                                <option value="radioBox">Radio Box</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="answers-container" class="col-form-label col-md-3">Answers:</label>
                        <div class="col-md-9" id="answers-container"></div>
                    </div>

                    <div class="form-group row">
                        <div class="col-md-9 offset-md-3">
                            <button type="button" id="add-answer-edit" class="btn btn-primary">Add Answer</button>
                        </div>
                    </div>
<!--                    <div class="form-group row">
                        <div class="col-md-9 offset-md-3">
                            <button type="submit" id="save" class="btn btn-success">Save</button>
                        </div>
                    </div>-->
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editQuestionForm"
                        onclick="validateForm2()">Update</button>
            </div>
        </div>
    </div>
</div>

<script>
</script>