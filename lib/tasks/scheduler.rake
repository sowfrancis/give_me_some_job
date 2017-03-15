desc "TODO: reindex job on producrion"
task :reindex_searchkick => :environment do
  jobs = Job.all
  jobs.each do |job|
    if job.save
      job.reindex
    end
  end
end