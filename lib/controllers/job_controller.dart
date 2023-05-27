
import 'package:flutter/material.dart';

import '../data_repository/job_repository.dart';
import '../models/job_model.dart';
import '../widgets/custom_snackbar.dart';

class JobProvider extends ChangeNotifier {
 

  bool isLoading = true;




 


  Future<List<JobModel>> getInitialJobs(BuildContext context) async {
      try {
    List<JobModel> initialJobs=    await JobRepository.getIntialAllJobs();
         isLoading = false;
        notifyListeners();
        return initialJobs;
      
      } catch (e) {
         isLoading = false;
        notifyListeners();
        errorSnackBar(context, e.toString());
        rethrow;
      }
  }
  Future<List<JobModel>> getPaginatedJobs(BuildContext context) async {
  
     try {
        isLoading = true;
        notifyListeners();
    List<JobModel> paginatedJobs=    await JobRepository.getPaginatedAllJobs();
         isLoading = false;
        notifyListeners();
        return paginatedJobs;
      
      } catch (e) {
         isLoading = false;
        notifyListeners();
        errorSnackBar(context, e.toString());
        rethrow;
      }
  }
}
