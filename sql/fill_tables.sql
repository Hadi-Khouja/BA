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
('Management');

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
INSERT INTO documents (documemt_file_name, documentType)
VALUES  
('Report_Final.docx', 'TechnicalSpecification'),
('Project_Presentation.pptx', 'MaintenanceReport'),
('Budget_Summary.xlsx', 'MarketingPlan'),
('Proposal_Draft.pdf', 'Invoice'),
('Meeting_Minutes.txt', 'ServiceContract'),
('Research_Paper.doc', 'TechnicalSpecification'),
('Presentation_Slides.ppt', 'MarketingPlan'),
('Agenda_Template.docx', 'Invoice'),
('Client_Pitch.pdf', 'ServiceContract'),
('Marketing_Plan.docx', 'MaintenanceReport'),
('Sales_Proposal.pdf', 'TechnicalSpecification'),
('Financial_Statement.xlsx', 'MarketingPlan'),
('Product_Catalog.pptx', 'Invoice'),
('Training_Manual.docx', 'ServiceContract'),
('Employee_Handbook.pdf', 'MaintenanceReport'),
('Case_Study.doc', 'TechnicalSpecification'),
('Strategic_Plan.pptx', 'MaintenanceReport'),
('Quarterly_Review.xlsx', 'Invoice'),
('Performance_Evaluation.docx', 'ServiceContract'),
('Business_Plan.pdf', 'MarketingPlan'),
('Invoice_Template.xlsx', 'TechnicalSpecification'),
('Contract_Document.doc', 'MaintenanceReport'),
('Event_Plan.pptx', 'Invoice'),
('Survey_Results.xlsx', 'ServiceContract'),
('Risk_Assessment.docx', 'TechnicalSpecification'),
('Policy_Document.pdf', 'MaintenanceReport'),
('SOP_Guidelines.docx', 'Invoice'),
('Technical_Specifications.pdf', 'ServiceContract'),
('Data_Analysis.xlsx', 'MarketingPlan'),
('Presentation_Outline.pptx', 'TechnicalSpecification');