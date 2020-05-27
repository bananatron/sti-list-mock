ActiveRecord::Base.transaction do

  # Examples of templates
  template = ListTemplate.create!(name: 'My template')
  ListTemplateItem.create!(
    list_template: template,
    item_type: 'Onboarding::PayrollPaperwork',
  )
  ListTemplateItem.create!(
    list_template: template,
    item_type: 'Onboarding::PayrollPaperwork',
  )
  template_item = ListTemplateItem.create!(
    list_template: template,
    item_type: 'Onboarding::PayrollPaperwork',
  )

  template_item.build_item # returns an instance of Onboarding::PayrollPaperwork

  list = List.create!(name: 'my list')
  # Examples of specific item types
  Onboarding::PayrollPaperwork.create!(
    list: list,
    meta: {
      dob: '01/01/1988',
      bank_account_number: '12341235',
    }
  )
  Onboarding::PrivacyDocumentation.create!(
    list: list,
    meta: {
      signed: true
    }
  )
  Compliance::VaccinationX.create!(list: list)

  Onboarding::PayrollPaperwork.all.sample.approve!
  Onboarding::PayrollPaperwork.all.sample.reject!

  puts Onboarding::PayrollPaperwork.first.dob
  puts Onboarding::PayrollPaperwork.first.bank_account_number
  puts Onboarding::PrivacyDocumentation.first.signed
  Onboarding::PayrollPaperwork.all.sample.approved?

end

