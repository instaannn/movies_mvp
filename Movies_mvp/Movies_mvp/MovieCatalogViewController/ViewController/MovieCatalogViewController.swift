// MovieCatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Каталог фильмов
final class MovieCatalogViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let segmentControlItems = ["Popular", "TopRated", "Upcoming"]
        static let cellIdentifier = "Cell"
        static let errorTitle = "Ошибка"
        static let accessibilityIdentifier = "MovieCatalogTableView"
    }

    // MARK: - Private visual Components

    private lazy var tableView = makeTableView()
    private lazy var containerView = UIView()
    private lazy var categorySegmentControl = SegmentControl(items: Constants.segmentControlItems)

    // MARK: - Public Properties

    var presenter: MovieCatalogPresenterProtocol?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
        setupNavigationController()
        setupCategorySegmentControl()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarHidden(true)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        setNavigationBarHidden(false)
    }

    // MARK: - Private methods

    func update() {
        presenter?.updateNextPage()
    }

    private func loadMovies(requestType: RequestType) {
        presenter?.loadMovies(requestType: requestType)
    }

    private func setNavigationBarHidden(_ isHidden: Bool) {
        navigationController?.setNavigationBarHidden(isHidden, animated: true)
    }

    private func setupNavigationController() {
        view.backgroundColor = .systemBackground
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    private func setupCategorySegmentControl() {
        categorySegmentControl.highlightSelectedSegment()
        categorySegmentControl.addTarget(self, action: #selector(segmentControlAction(_:)), for: .valueChanged)
        categorySegmentControl.selectedSegmentIndex = 0
        categorySegmentControl.underlinePosition()
    }

    private func goToDetailMoviewViewController(id: Int) {
        presenter?.selectMovie(id: id)
    }

    private func updateForSegment() {
        presenter?.updateForSegment()
    }

    private func setupTableView() {
        tableView.accessibilityIdentifier = Constants.accessibilityIdentifier
    }

    @objc private func segmentControlAction(_ sender: UISegmentedControl) {
        presenter?.segmentControlUpdate(index: sender.selectedSegmentIndex)
        categorySegmentControl.underlinePosition()
    }
}

// MARK: - MovieCatalogViewProtocol

extension MovieCatalogViewController: MovieCatalogViewProtocol {
    func succes() {
        tableView.reloadData()
    }

    func failure(_ error: Error) {
        showAlert(title: Constants.errorTitle, message: error.localizedDescription)
    }
}

// MARK: - UITableViewDelegate

extension MovieCatalogViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToDetailMoviewViewController(id: presenter?.movies[indexPath.row].id ?? 0)
    }
}

// MARK: - UITableViewDataSource

extension MovieCatalogViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.movies.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier
        ) as? MovieCatalogTableViewCell else { return UITableViewCell() }
        guard let movies = presenter?.movies else { return UITableViewCell() }
        if indexPath.row == movies.count - 1 {
            update()
        }
        cell.configure(movie: movies[indexPath.row])
        return cell
    }
}

// MARK: - SetupUI

private extension MovieCatalogViewController {
    func setupUI() {
        view.addSubview(tableView)
        view.addSubview(containerView)
        containerView.addSubview(categorySegmentControl)

        setUpConstraints()
    }

    func setupBinding() {
        presenter?.loadMovies(requestType: .popular)
    }

    func setUpConstraints() {
        [
            tableView,
            containerView,
            categorySegmentControl
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 50),

            categorySegmentControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            categorySegmentControl.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            categorySegmentControl.heightAnchor.constraint(equalToConstant: 30),
            categorySegmentControl.widthAnchor.constraint(equalToConstant: 250),

            tableView.topAnchor.constraint(equalTo: containerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - Factory

private extension MovieCatalogViewController {
    func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(MovieCatalogTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }
}
