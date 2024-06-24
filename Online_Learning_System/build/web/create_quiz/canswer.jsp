<%-- 
    Document   : canswer
    Created on : Jun 17, 2024, 5:46:27 PM
    Author     : hatro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="editQuiz">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h5 class="modal-title">Add Question</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="question?action=create" method="POST">
                    <div class="form-group row">
                        <label for="" class="col-form-label col-md-3">Question No:</label>
                        <div class="col-md-9">
                            <input type="number" min="1" max="20" class="form-control" id="questionNoInput" name="questionNumber">
                            <div id="nameError" class="error"></div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="" class="col-form-label col-md-3">Title:</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="titleInput" name="titleQuestion">
                            <div id="nameError" class="error"></div>
                        </div>
                    </div>
                    <div class="form-group row" hidden="">
                        <label for="" class="col-form-label col-md-3">Type:</label>
                        <div class="col-md-4">
                            <select class="custom-select" id="typeQuestion" name="typeQuestion" onchange="updateAnswerType()">
                                <option value="checkBox">Check Box</option>
                                <option value="radioBox">Radio Box</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="" class="col-form-label col-md-3">Answers:</label>
                        <div class="col-md-9" id="answers-container">
                            <!--                        <div class="answer-row">
                                                        <input type="text" name="answer" class="form-control">
                                                        <input type="checkbox" name="correctAnswer1" class="form-check-input">
                                                    </div>-->
                        </div>
                    </div>

                    <!-- Add New Answer -->
                    <div class="form-group row">
                        <div class="col-md-9 offset-md-3">
                            <button type="button" id="add-answer" class="btn btn-primary">Add Answer</button>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-9 offset-md-3">
                            <button type="submit" id="save" class="btn btn-success">Save</button>
                        </div>
                    </div>

                    <!-- Add this div to display saved questions -->
                </form>
            </div>
        </div>

<!--         Edit and Delete Modals 
        <div id="editQuestionModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editQuestionModalLabel"
             aria-hidden="true">
             Your edit modal content here 
        </div>-->

    </div>
</div>
<!-- JavaScript -->
<script>
    function updateAnswerType() {
        // take typeQuestion of answer already exit
        const typeQuestion = document.getElementById('typeQuestion').value;
        // choice all element in answers-container is checkbox or radiobox
        const answerInputs = document.querySelectorAll('#answers-container .answer-row input[type="checkbox"], #answers-container .answer-row input[type="radio"]');

        // loop for each element in answerInput
        answerInputs.forEach(input => {
            // check value of typeQuestion if typeQuestion == checkbox then typeQuestion is checkbox, 
            // name is correctAnswer
            // add class custom-checkbox in heand in
            if (typeQuestion === 'checkBox') {
                input.type = 'checkbox';
                input.name = 'correctAnswer';
                input.classList.add('custom-checkbox');
                // name is correctAnswer
                // remove class custom-checkbox in heand in
            } else {
                input.type = 'radio';
                input.name = 'correctAnswer';
                input.classList.remove('custom-checkbox');
            }
        });
    }

    document.addEventListener('DOMContentLoaded', function () {
        // call function updateAnswerType();
        updateAnswerType();
        // add new event in button Add Answer, if user click button event run
        document.getElementById('add-answer').addEventListener('click', function () {
            // call element have id = answers-container container row of new answer
            var container = document.getElementById('answers-container');
            // create block div container row new anser
            const answerRow = document.createElement('div');
            // name it of class div is answer-row
            answerRow.className = 'answer-row';

            // create element input new of text of answer
            const input = document.createElement('input');
            input.type = 'text';
            input.name = 'answer';
            // create heand in of class is form-control
            input.className = 'form-control';

            // create new  element input  for select correct or incorrect of answer
            const correctAnswerInput = document.createElement('input');
            // create value for correctAnswerInput is
            correctAnswerInput.type = document.getElementById('typeQuestion').value === 'checkBox' ? 'checkbox' : 'radio';
            correctAnswerInput.name = 'correctAnswer' + (container.children.length + 1);
            correctAnswerInput.className = 'form-check-input';
            // if correctAnswerInput have type is checkbox heand in class custom checkbox
            if (correctAnswerInput.type === 'checkbox') {
                correctAnswerInput.classList.add('custom-checkbox');
            }
            //This line adds a text input element to the div element containing the answer row.
            answerRow.appendChild(input);
            answerRow.appendChild(correctAnswerInput);
            // This line adds the answer row div element to answers-container, i.e. adds a new answer row to the answers list.
            container.appendChild(answerRow);
        });

        //create new array is blank contain all question
//                const questions = [];

//                document.getElementById('save').addEventListener('click', function () {
//                    const questionNo = document.getElementById('questionNoInput').value;
//                    const title = document.getElementById('titleInput').value;
//                    const type = document.getElementById('typeQuestion').value;
//                    const answers = [];
//
//                    const answerRows = document.querySelectorAll('#answers-container .answer-row');
//                    answerRows.forEach(function (row) {
//                        const answerText = row.querySelector('input[name="answer"]').value;
//                        const isCorrect = row.querySelector('input[name="correctAnswer"]').checked;
//                        answers.push({text: answerText, correct: isCorrect});
//                    });
//
//                    const question = {
//                        questionNo: questionNo,
//                        title: title,
//                        type: type,
//                        answers: answers
//                    };
//
//                    questions.push(question);
//                    addQuestionToList(question);
//                });
    });
</script>





