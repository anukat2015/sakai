<%-- $Id: deliverShortAnswer.jsp 14269 2006-09-07 16:56:32Z daisyf@stanford.edu $
include file for delivering short answer essay questions
should be included in file importing DeliveryMessages
--%>
<!--
* $Id: deliverShortAnswer.jsp 14269 2006-09-07 16:56:32Z daisyf@stanford.edu $
<%--
***********************************************************************************
*
* Copyright (c) 2004, 2005, 2006 The Sakai Foundation.
*
* Licensed under the Educational Community License, Version 1.0 (the"License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*      http://www.opensource.org/licenses/ecl1.php
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License. 
*
**********************************************************************************/
--%>
-->
<h:outputText value="#{question.text}"  escape="false"/>

<!-- ATTACHMENTS -->
<%@ include file="/jsf/delivery/item/attachment.jsp" %>

<h:panelGroup 
     rendered="#{!(delivery.actionString=='reviewAssessment'
            || delivery.actionString=='gradeAssessment')}">
<f:verbatim><br/><br/></f:verbatim>
<h:outputText value="#{msg.maxSAText}"/>
</h:panelGroup> 
<f:verbatim><br/></f:verbatim>
<h:inputTextarea rows="20" cols="80" value="#{question.responseText}" 
   disabled="#{delivery.actionString=='reviewAssessment'
            || delivery.actionString=='gradeAssessment'}" >
<f:validateLength maximum="4000"/>
</h:inputTextarea>

<f:verbatim><br /></f:verbatim>
<h:selectBooleanCheckbox value="#{question.review}" id="mark_for_review"
   rendered="#{(delivery.actionString=='previewAssessment'
                || delivery.actionString=='takeAssessment'
                || delivery.actionString=='takeAssessmentViaUrl')
             && delivery.navigation ne '1'}" />

<h:outputLabel for="mark_for_review" value="#{msg.mark}"
  rendered="#{(delivery.actionString=='previewAssessment'
                || delivery.actionString=='takeAssessment'
                || delivery.actionString=='takeAssessmentViaUrl')
             && delivery.navigation ne '1'}" />

<h:panelGroup rendered="#{delivery.feedback eq 'true'}">
  <f:verbatim><br /></f:verbatim>
  <h:panelGroup rendered="#{delivery.feedbackComponent.showCorrectResponse && !delivery.noFeedback=='true'&& question.modelAnswerIsNotEmpty}" >
    <f:verbatim><b></f:verbatim>
    <h:outputLabel for="answerKeyMC" value="#{msg.model} " />
     <f:verbatim></b></f:verbatim>

	<h:outputLink title="#{msg.t_modelShortAnswer}"   value="#" onclick="javascript:window.open('modelShortAnswer.faces?idString=#{question.itemData.itemId}','modelShortAnswer','width=600,height=600,scrollbars=yes, resizable=yes');" onkeypress="javascript:window.open('modelShortAnswer.faces?idString=#{question.itemData.itemId}','modelShortAnswer','width=600,height=600,scrollbars=yes, resizable=yes');">
	<h:outputText  value="#{msg.click_here}"/>
    </h:outputLink>

<%-- alert screen is a problem 'cos comment often contains html tag added in WYSIWYG
    <h:outputLink title="#{msg.t_key}" value="#" onclick="javascript:window.alert('#{question.keyInUnicode}');"  onkeypress="javascript:window.alert('#{question.keyInUnicode}');" >
    <h:outputText  value="#{msg.click}" />
    </h:outputLink>
--%>

  </h:panelGroup>
  <h:panelGroup rendered="#{delivery.feedbackComponent.showItemLevel && !delivery.noFeedback=='true' && question.feedbackIsNotEmpty}">
    <f:verbatim><br /></f:verbatim>
    <f:verbatim><b></f:verbatim>
    <h:outputLabel for="feedSC" value="#{msg.feedback}#{msg.column} " />
    <f:verbatim></b></f:verbatim>
    <h:outputText id="feedSC" value="#{question.feedback}" escape="false" />
  </h:panelGroup>
  <h:panelGroup rendered="#{delivery.feedbackComponent.showGraderComment && !delivery.noFeedback=='true' && question.gradingCommentIsNotEmpty}">
    <f:verbatim><br /></f:verbatim>
    <f:verbatim><b></f:verbatim>
    <h:outputLabel for="commentSC" value="#{msg.comment}#{msg.column} " />
    <f:verbatim></b></f:verbatim>
    <h:outputText id="commentSC" value="#{question.gradingComment}"
      escape="false" />
  </h:panelGroup>
</h:panelGroup>
