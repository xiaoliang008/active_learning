% selects points with posterior probability above a specified threshold.
%
% function test_ind = probability_treshold_selector(data, labels, ...
%           train_ind, probability_function, threshold)
%
% where
%                   data: an (n x d) matrix of input data
%                 labels: an (n x 1) vector of labels
%              train_ind: a list of indices into data/labels
%                         indicating the training points
%   probability_function: a function handle providing a probability
%                         function
%              threshold: a value in [0, 1]; points with posterior
%                         probability greater than or equal to this
%                         in any class are selected
%
%   test_ind: a list of indices into data/labels indicating the
%             points to test
%
% copyright (c) roman garnett, 2011--2012

function test_ind = probability_treshold_selector(data, labels, ...
          train_ind, probability_function, threshold)

  test_ind = identity_selector(labels, train_ind);
  probabilities = probability_function(data, labels, train_ind, test_ind);

  test_ind = find(any(probabilities >= threshold), 2);

end
