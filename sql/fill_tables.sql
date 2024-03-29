-- Users Inserts
INSERT INTO users (name)
VALUES 
('John Doe'), 
('Alice Smith'), 
('Michael Johnson'), 
('Emma Williams'), 
('James Brown'), 
('Olivia Garcia'), 
('William Martinez'),
('Sophia Anderson'),
('Daniel Thomas'),
('Ava Hernandez'), 
('Alexander Lopez');

-- groups inserts
INSERT INTO groups(name)
VALUES 
('Development'),
('Marketing'),
('Accounting'),
('Managers');

-- assiging Roles
INSERT INTO memberOf(user_id, group_id)
VALUES  
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 3),
(8, 3),
(9, 3),
(10, 4),
(11, 4);

-- Adding documents
INSERT INTO documents (name)
VALUES  
('Report_Final.docx'),
('Project_Presentation.pptx'),
('Budget_Summary.xlsx'),
('Proposal_Draft.pdf'),
('Meeting_Minutes.txt'),
('Research_Paper.doc'),
('Presentation_Slides.ppt'),
('Agenda_Template.docx'),
('Client_Pitch.pdf'),
('Marketing_Plan.docx'),
('Sales_Proposal.pdf'),
('Financial_Statement.xlsx'),
('Product_Catalog.pptx'),
('Training_Manual.docx'),
('Employee_Handbook.pdf'),
('Case_Study.doc'),
('Strategic_Plan.pptx'),
('Quarterly_Review.xlsx'),
('Performance_Evaluation.docx'),
('Business_Plan.pdf'),
('Invoice_Template.xlsx'),
('Contract_Document.doc'),
('Event_Plan.pptx'),
('Survey_Results.xlsx'),
('Risk_Assessment.docx'),
('Policy_Document.pdf'),
('SOP_Guidelines.docx'),
('Technical_Specifications.pdf'),
('Data_Analysis.xlsx'),
('Presentation_Outline.pptx');

-- Reading Rights for users
INSERT INTO readRights (owner_user_id, document_id, ExportDependentDocument, ExportOriginal, ReadActivities, ReadArchive, ReadAttributes, ReadProcessing, ReadRelease, ReadBlocked, ReadVerification, ReadHiddenAttributes, DisplayingWithWatermark)
VALUES 
(1, 1, true, false, true, false, true, false, true, false, true, false, true),
(2, 2, false, true, false, true, false, true, false, true, false, true, false),
(3, 3, true, true, false, false, true, true, false, false, true, true, false),
(4, 4, false, false, true, true, false, false, true, true, false, false, true),
(5, 5, true, true, true, true, false, false, false, false, true, true, true),
(6, 6, false, false, false, false, true, true, true, true, false, false, false),
(7, 7, true, false, false, true, true, false, false, true, true, false, true),
(8, 8, false, true, true, false, false, true, true, false, false, true, false),
(9, 9, true, false, true, false, true, false, true, false, true, false, true),
(10, 10, false, true, false, true, false, true, false, true, false, true, false),
(11, 11, true, true, true, true, true, true, true, true, true, true, true),
(1, 12, true, false, true, false, true, false, true, false, true, false, true),
(2, 13, false, true, false, true, false, true, false, true, false, true, false),
(3, 14, true, true, false, false, true, true, false, false, true, true, false),
(4, 15, false, false, true, true, false, false, true, true, false, false, true),
(5, 16, true, true, true, true, false, false, false, false, true, true, true),
(6, 17, false, false, false, false, true, true, true, true, false, false, false),
(7, 18, true, false, false, true, true, false, false, true, true, false, true),
(8, 19, false, true, true, false, false, true, true, false, false, true, false),
(9, 20, true, false, true, false, true, false, true, false, true, false, true),
(10, 21, false, true, false, true, false, true, false, true, false, true, false),
(11, 22, true, true, true, true, true, true, true, true, true, true, true);

-- Reading Rights for groups
INSERT INTO readRights (owner_group_id, document_id, ExportDependentDocument, ExportOriginal, ReadActivities, ReadArchive, ReadAttributes, ReadProcessing, ReadRelease, ReadBlocked, ReadVerification, ReadHiddenAttributes, DisplayingWithWatermark)
VALUES 
(1, 23, true, false, true, false, true, false, true, false, true, false, true),
(2, 24, false, true, false, true, false, true, false, true, false, true, false),
(3, 25, true, true, false, false, true, true, false, false, true, true, false),
(4, 26, false, false, true, true, false, false, true, true, false, false, true),
(1, 27, true, false, true, false, true, false, true, false, true, false, true),
(2, 28, false, true, false, true, false, true, false, true, false, true, false),
(3, 29, true, true, false, false, true, true, false, false, true, true, false),
(4, 30, false, false, true, true, false, false, true, true, false, false, true);



-- Write Rights for users
INSERT INTO writeRights (owner_user_id, document_id, ChangeAttributesRelease, ChangeProtectedAttributes, ChangeHiddenAttributes, UpdateDocument, ImportDocument, ChangeDocumentType, CreatingDependantDocuments, CreateChangeNotes, CreateChangeRedlining, ChangeColorMarking, DeleteArchive, DeleteProcessing, DeleteRelease, DeleteVerification)
VALUES 
(1, 1, true, false, true, false, true, false, true, false, true, false, true, false, true, false),
(2, 2, false, true, false, true, false, true, false, true, false, true, false, true, false, true),
(3, 3, true, true, false, false, true, true, false, true, true, false, false, true, true, false),
(4, 4, false, false, true, true, false, false, true, false, false, true, true, false, false, true),
(5, 5, true, true, true, true, false, false, true, true, true, true, true, true, true, true),
(6, 6, false, false, false, false, true, true, false, false, false, false, false, false, false, false),
(7, 7, true, false, false, true, true, false, false, true, false, false, true, false, true, false),
(8, 8, false, true, true, false, false, true, true, false, true, true, false, true, false, true),
(9, 9, true, false, true, false, true, false, true, true, false, true, true, false, true, false),
(10, 10, false, true, false, true, false, true, false, true, true, false, true, false, true, false),
(11, 11, true, true, true, true, true, true, true, true, true, true, true, true, true, true),
(1, 12, true, false, true, false, true, false, true, false, true, false, true, false, true, false),
(2, 13, false, true, false, true, false, true, false, true, false, true, false, true, false, true),
(3, 14, true, true, false, false, true, true, false, true, true, false, false, true, true, false),
(4, 15, false, false, true, true, false, false, true, false, false, true, true, false, false, true),
(5, 16, true, true, true, true, false, false, true, true, true, true, true, true, true, true),
(6, 17, false, false, false, false, true, true, false, false, false, false, false, false, false, false),
(7, 18, true, false, false, true, true, false, false, true, false, false, true, false, true, false),
(8, 19, false, true, true, false, false, true, true, false, true, true, false, true, false, true),
(9, 20, true, false, true, false, true, false, true, true, false, true, true, false, true, false),
(10, 21, false, true, false, true, false, true, false, true, true, false, true, false, true, false),
(11, 22, true, true, true, true, true, true, true, true, true, true, true, true, true, true);

-- write rights for groups
INSERT INTO writeRights (owner_group_id, document_id, ChangeAttributesRelease, ChangeProtectedAttributes, ChangeHiddenAttributes, UpdateDocument, ImportDocument, ChangeDocumentType, CreatingDependantDocuments, CreateChangeNotes, CreateChangeRedlining, ChangeColorMarking, DeleteArchive, DeleteProcessing, DeleteRelease, DeleteVerification)
VALUES 
(1, 23, true, false, true, false, true, false, true, false, true, false, true, false, true, false),
(2, 24, false, true, false, true, false, true, false, true, false, true, false, true, false, true),
(3, 25, true, true, false, false, true, true, false, true, true, false, false, true, true, false),
(4, 26, false, false, true, true, false, false, true, false, false, true, true, false, false, true),
(1, 27, true, false, true, false, true, false, true, false, true, false, true, false, true, false),
(2, 28, false, true, false, true, false, true, false, true, false, true, false, true, false, true),
(3, 29, true, true, false, false, true, true, false, true, true, false, false, true, true, false),
(4, 30, false, false, true, true, false, false, true, false, false, true, true, false, false, true);