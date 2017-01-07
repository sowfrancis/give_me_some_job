class Candidacy < ActiveRecord::Base
  validates :job_id, uniqueness: { scope: :user_id,
    message: "vous ne pouvez envoyer qu'une candidature!" }
  validates :user_id, uniqueness: { scope: :job_id,
    message: "vous ne pouvez envoyer qu'une candidature!" }
end
